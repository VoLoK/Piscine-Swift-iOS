//
//  UserModel.swift
//  rush00
//
//  Created by Why on 8/17/22.
//

import Foundation

struct UserModel: Decodable, Equatable {
    let id: Int
    let email: String
    let login: String
    let firstName: String
    let lastName: String
    let usualFullName: String
    let usualFirstName: String?
    let url: URL
    let phone: String
    let displayName: String
    let imageURL: URL?
    let imageURLNew: URL?
    let staff: Bool
    let correctionPoint: Int
    let poolMonth: String?
    let poolYear: String?
    let location: String?
    let wallet: Int
    let alumni: Bool?
    let isLaunched: Bool?
    let cursusUsers: [CursusModel]
    let projectsUsers: [ProjectsUsers]
    let achievements: [AchievementsModel]
    let campus: [CampusModel]
    let campusUsers: [CampusUsersModel]
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case login
        case firstName = "first_name"
        case lastName = "last_name"
        case usualFullName = "usual_full_name"
        case usualFirstName = "usual_first_name"
        case url
        case phone
        case displayName = "displayname"
        case imageURL = "image_url"
        case imageURLNew = "new_image_url"
        case staff = "staff?"
        case correctionPoint = "correction_point"
        case poolMonth = "pool_month"
        case poolYear = "pool_year"
        case location
        case wallet
        case alumni
        case isLaunched = "is_launched?"
        case cursusUsers = "cursus_users"
        case projectsUsers = "projects_users"
        case achievements
        case campus
        case campusUsers = "campus_users"
    }
}

struct CursusModel: Decodable, Equatable {
    let grade: String?
    let level: Double
    let skills: [SkillsModel]
    let id: Int
    let cursusID: Int
    let hasCoalition: Bool
    let user: UserModelInside
    let cursus: CursusInfo
    
    enum CodingKeys: String, CodingKey {
        case grade
        case level
        case skills
        case id
        case cursusID = "cursus_id"
        case hasCoalition = "has_coalition"
        case user
        case cursus
    }
    
    struct SkillsModel: Decodable, Equatable {
        let id: Int
        let name: String
        let level: Double
    }
    
    struct CursusInfo: Decodable, Equatable {
        let id: Int
        let name: String
        let slug: String
    }
}

struct ProjectsUsers: Decodable, Equatable {
    let id: Int
    let occurrence: Int
    let finalMark: Int?
    let status: String
    let validated: Bool?
    let currentTeamID: Int?
    let project: ProjectModel
    let cursusIDs: [Int]
    let marked: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case occurrence
        case finalMark = "final_mark"
        case status
        case validated = "validated?"
        case currentTeamID = "current_team_id"
        case project
        case cursusIDs = "cursus_ids"
        case marked
    }
    
    struct ProjectModel: Decodable, Equatable {
        let id: Int
        let name: String
        let slug: String
        let parentID: Int?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case slug
            case parentID = "parent_id"
        }
    }
}

struct AchievementsModel: Decodable, Equatable {
    let id: Int
    let name: String
    let description: String
    let tier: String
    let kind: String
    let visible: Bool
    let image: URL
    let nbrOfSuccess: Int?
    let usersURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case tier
        case kind
        case visible
        case image
        case nbrOfSuccess = "nbr_of_success"
        case usersURL = "users_url"
    }
}

struct CampusModel: Decodable, Equatable {
    let id: Int
    let name: String
    let language: LanguageModel
    let usersCount: Int
    let vogsphereID: Int
    let country: String
    let address: String
    let zip: String
    let city: String
    let website: String
    let facebook: String?
    let twitter: String?
    let active: Bool
    let emailExtension: String
    let defaultHiddenPhone: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case language
        case usersCount = "users_count"
        case vogsphereID = "vogsphere_id"
        case country
        case address
        case zip
        case city
        case website
        case facebook
        case twitter
        case active
        case emailExtension = "email_extension"
        case defaultHiddenPhone = "default_hidden_phone"
    }
    
    struct LanguageModel: Decodable, Equatable {
        let id: Int
        let name: String
        let identifier: String
    }
}

struct CampusUsersModel: Decodable, Equatable {
    let id: Int
    let userID: Int
    let campusID: Int
    let isPrimart: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case campusID = "campus_id"
        case isPrimart = "is_primary"
    }
}

struct UserModelInside: Decodable, Equatable {
    let id: Int
    let email: String
    let login: String
    let firstName: String
    let lastName: String
    let usualFullName: String?
    let usualFirstName: String?
    let url: URL
    let phone: String?
    let displayName: String
    let imageURL: URL?
    let staff: Bool
    let correctionPoint: Int
    let poolMonth: String?
    let poolYear: String?
    let location: String?
    let wallet: Int
    let alumni: Bool?
    let isLaunched: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case login
        case firstName = "first_name"
        case lastName = "last_name"
        case usualFullName = "usual_full_name"
        case usualFirstName = "usual_first_name"
        case url
        case phone
        case displayName = "displayname"
        case imageURL = "image_url"
        case staff = "staff?"
        case correctionPoint = "correction_point"
        case poolMonth = "pool_month"
        case poolYear = "pool_year"
        case location
        case wallet
        case alumni
        case isLaunched = "is_launched?"
    }
}
