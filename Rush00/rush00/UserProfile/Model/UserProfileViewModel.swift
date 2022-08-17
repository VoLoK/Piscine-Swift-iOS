//
//  UserProfileViewModel.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import Foundation

struct UserProfileViewModel: Equatable {
    let campus: String
    let profileIconData: Data?
    let staff: Bool
    let cursus: [UserProfileCursusViewModel]
    let projectsUsers: [UserProfileProjectViewModel]
    let achievements: [UserProfileAchievementsViewModel]
}
