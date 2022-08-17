//
//  UserProfileFactory.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import Foundation
import UIKit

// MARK: - UserProfileFactory

final class UserProfileFactory {
    private let profileViewModel: UserProfileViewModel
    
    required init(model: UserProfileViewModel) {
        self.profileViewModel = model
    }
    
    func build() -> UIViewController {
        let viewController = UserProfileViewController(with: profileViewModel)
        
        return viewController
    }
}

