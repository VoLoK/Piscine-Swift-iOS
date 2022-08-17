//
//  MainViewController.swift
//  rush00
//
//  Created by Clothor- on 16.08.2022.
//

import Foundation
import UIKit
import WebKit

enum EState {
    case code
    case token
}

class AuthorizationViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    var webView: WKWebView!
    var state: String = ""
    var current_state: EState = EState.code
    var storeToken: [String: String] = [:]
    var err: Error!
    
    override func loadView() {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { (records) in
            for record in records {
                if record.displayName.contains("42") {
                    dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: [record], completionHandler: {
                        DispatchQueue.main.async {
                            self.webView.reload()
                        }
                    })
                }
            }
        }
        webView = WKWebView()
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Welcome"
        authorization()
    }
    
    var interactor: AuthorizationInteractor?
}

extension AuthorizationViewController {
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func tryLogin() {
        let token = storeToken["token"] ?? ""
        interactor = AuthorizationInteractor(token: token)
        interactor?.getMe { [weak self] model in
            guard let self = self else { return }
            let userInfo = UserProfileFactory(model: model)
            let viewController = userInfo.build()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func authorization() {
        self.state = randomString(length: 20)
        let base_url = "https://api.intra.42.fr/oauth/authorize"

        let parametrs: [String : String] = [
            "client_id" : TokenService.uid,
            "redirect_uri" : "http://127.0.0.1",
            "scope" : "public+profile",
            "state" : self.state,
            "response_type" : "code"
        ]
        var substr: String = ""
        for (key, val) in parametrs {
            substr += "&\(key)=\(val)"
        }
        let requestStr = base_url + "?" + substr
        let url = URL(string: requestStr)
        var request: URLRequest = URLRequest(url: url!)
        request.httpMethod = "GET"
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let components = URLComponents(string: navigationAction.request.url!.absoluteString)
        let code = components?.queryItems?.first { $0.name == "code" }?.value
        let state = components?.queryItems?.first { $0.name == "state" }?.value
        if navigationAction.request.url!.absoluteString.contains("error=access_denied") {
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            decisionHandler(WKNavigationActionPolicy.cancel)
            return
        }
        
        if code != nil && state == self.state && self.current_state == EState.code {
            self.current_state = EState.token
            let params: [String: String] = [
                "client_id": TokenService.uid,
                "client_secret": TokenService.secret,
                "redirect_uri": "http://127.0.0.1",
                "state": self.state,
                "code": code!,
                "grant_type": "authorization_code",
            ]
            let urlString = "https://api.intra.42.fr/oauth/token"
            var substr: String = ""
            for (key, val) in params {
                substr += "&\(key)=\(val)"
            }
            let url: URL = URL(string: urlString)!
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = substr.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let err = error {
                    self.err = err
                }
                else if let d = data {
                    do {
                        if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d) as? NSDictionary {
                            self.storeToken["token"] = dic.value(forKey: "access_token") as? String
                            DispatchQueue.main.async() {
                                print(self.storeToken)
                                user_token = self.storeToken["token"] ?? "0"
                                print(user_token)
                                self.tryLogin()
                            }
                        }
                    }
                    catch (let err) {
                        self.err = err
                    }
                }
            }
            task.resume()
        }
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
}
