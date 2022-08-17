//
//  ViewController.swift
//  rush00
//
//  Created by Anisa Kapateva on 16.08.2022.
//

import UIKit

class AuthViewController: UIViewController {

    let stackView = UIStackView()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let incorrectLabel = UILabel()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
                
        setupStackView()
        setupSubviews()
    }

}

extension AuthViewController {
    @objc func tryLogin() {
        // authorization logic
        authorization()
        let story = UIStoryboard (name: "Main", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "MainViewController") as! AuthorizationViewController
        controller.modalPresentationStyle = .fullScreen
//        self.present(controller, animated: true, completion: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func authorization() {
        
    }
}

extension AuthViewController {
    
    func setupSubviews() {
        loginTextField.placeholder = "Login"
        loginTextField.borderStyle = .roundedRect
        
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.layer.borderWidth = 0.8
        loginButton.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
        
        incorrectLabel.isHidden = true
        incorrectLabel.text = "Invalid login pr password."
        incorrectLabel.textColor = .systemRed
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(incorrectLabel)
        stackView.addArrangedSubview(loginButton)
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        incorrectLabel.translatesAutoresizingMaskIntoConstraints = false
        incorrectLabel.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 56.0).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 56.0).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 56.0).isActive = true
        
    }
}

