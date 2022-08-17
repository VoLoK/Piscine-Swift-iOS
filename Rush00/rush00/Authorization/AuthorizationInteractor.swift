//
//  AuthorizationInteractor.swift
//  rush00
//
//  Created by Why on 8/17/22.
//

import Foundation
import Alamofire
import UIKit

final class AuthorizationInteractor {
    
    private let token: String
    
    init(token: String) {
        self.token = token
    }
    
    func getMe(closure: @escaping (UserProfileViewModel) -> () ) {
        let baseURL = "https://api.intra.42.fr/v2/me"
        let bearer = "Bearer \(token)"
        let headers = HTTPHeaders(["Authorization": bearer])
        AF.request(baseURL, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: UserModel.self) { [weak self] response in
                guard let self = self else { return }
                print(response.result)
                
                if let model = response.value {
                    let wow = self.makeViewModelFromResponse(model)
                    closure(wow)
                }
            }
        
    }
    
}


// MARK: - extension

private extension AuthorizationInteractor {
    func makeViewModelFromResponse(_ userModel: UserModel) -> UserProfileViewModel {
        let campus = userModel.campus.last?.city ?? ""
        let profileIcon: Data? = UIImage(named: "default")?.pngData()
        let cursus = makeCursus(userModel.cursusUsers)
        let projectsUsers = userModel.projectsUsers.filter { $0.project.parentID == nil && $0.finalMark != nil }
            .map { getUserProject(model: $0) }
        let achievementsUser = userModel.achievements.filter { $0.visible }
            .map { getUserAchievement(model: $0) }

        return UserProfileViewModel(
            campus: campus,
            profileIconData: profileIcon,
            staff: userModel.staff,
            cursus: cursus,
            projectsUsers: projectsUsers,
            achievements: achievementsUser
        )
    }
    
    func makeCursus(_ cursus: [CursusModel]) -> [UserProfileCursusViewModel] {
        var cursusViewModel: [UserProfileCursusViewModel] = []
        for model in cursus {
            var joined: String? = nil
            if let poolMonth = model.user.poolMonth,
               let poolYear = model.user.poolYear {
                joined = "\(poolMonth) \(poolYear)"
            }
            let userLevel = getUserLevel(model.level)
            let progress = Float(model.level - model.level.rounded(.down))
            let skills = getUserSkills(model.skills)
            let cursusName = model.user.staff ? nil : model.cursus.name
            
            let viewModel = UserProfileCursusViewModel(
                userFullName: model.user.usualFullName ?? "",
                login: model.user.login,
                joined: joined,
                grade: model.grade,
                email: model.user.email,
                phone: model.user.phone ?? "",
                location: model.user.location,
                points: model.user.correctionPoint,
                wallet: model.user.wallet,
                userLevel: userLevel,
                progress: progress,
                skills: skills,
                cursusID: model.cursusID,
                cursusName: cursusName
            )
            cursusViewModel.append(viewModel)
        }
        return cursusViewModel
    }
    
    func getUserSkills(_ skills: [CursusModel.SkillsModel]) -> [UserProfileSkillsViewModel] {
        var userSkills: [UserProfileSkillsViewModel] = []
        for skill in skills {
            let level = String(format: "%.2f", skill.level)
            let progress = Float(skill.level / 21)
            let userSkill = UserProfileSkillsViewModel(
                skillExperience: "\(skill.name): \(level)",
                progress: progress
            )
            userSkills.append(userSkill)
        }
        return userSkills
    }
    
    func getUserLevel(_ value: Double) -> String {
        let level = Int(value.rounded(.down))
        let levelPercent: Double = (value - Double(level)) * 100
        let levelPercentFormated = String(format: "%.f", levelPercent)
        let userLevel = "level \(level) - \(levelPercentFormated)%"
        return userLevel
    }
    
    func getUserProject(model: ProjectsUsers) -> UserProfileProjectViewModel {
        let mark = model.finalMark ?? 0
        let validated = model.validated ?? false
        return UserProfileProjectViewModel(
            projectName: model.project.name,
            finalMark: "\(mark)",
            validated: validated
        )
    }
    
    func getUserAchievement(model: AchievementsModel) -> UserProfileAchievementsViewModel {
        UserProfileAchievementsViewModel(
            name: model.name,
            description: model.description,
            tier: model.tier
        )
    }
}
