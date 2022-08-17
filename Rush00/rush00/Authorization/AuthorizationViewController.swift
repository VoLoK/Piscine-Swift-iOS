//
//  MainViewController.swift
//  rush00
//
//  Created by Clothor- on 16.08.2022.
//

import Foundation
import UIKit

class AuthorizationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        title = "Welcome"
        let logOutButton = UIBarButtonItem(title: "Log Out",
                                           style: .done,
                                           target: self,
                                           action: #selector(popVC(sender:)))
        navigationItem.rightBarButtonItem = logOutButton
    }
}

extension AuthorizationViewController {
    @objc func popVC(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
