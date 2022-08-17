//
//  UserProfileCursusViewModel.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import Foundation

struct UserProfileCursusViewModel: Equatable {
    let userFullName: String
    let login: String
    let joined: String?
    let grade: String?
    let email: String
    let phone: String
    let location: String?
    let points: Int
    let wallet: Int
    let userLevel: String
    let progress: Float
    let skills: [UserProfileSkillsViewModel]
    let cursusID: Int
    let cursusName: String?
}
