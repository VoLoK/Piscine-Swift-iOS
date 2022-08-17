//
//  UserProfileView.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileView: UIView {

    private var viewConstraints: [NSLayoutConstraint] = []
    private var skillsCount: Int = 0
    private var projectsCount: Int = 0
    private var achievementsCount: Int = 0

    private lazy var userHeaderView: UserProfileHeaderView = {
        let view = UserProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userInfoView: UserProfileInfoView = {
        let view = UserProfileInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userLocationView: UserProfileLocationView = {
        let view = UserProfileLocationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var userPointsView: UserProfilePointsView = {
        let view = UserProfilePointsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userProgressView: UserProfileProgressView = {
        let view = UserProfileProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userSkillsView: UserProfileSkillsView = {
        let view = UserProfileSkillsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userProjectView: UserProfileProjectsView = {
        let view = UserProfileProjectsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userAchievementsView: UserProfileAchievementsView = {
        let view = UserProfileAchievementsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    required init() {
        super.init(frame: .zero)
        addSubviews()
        makeConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(
        campus: String,
        profileIcon: Data?,
        cursus: UserProfileCursusViewModel,
        projects: [UserProfileProjectViewModel],
        achievements: [UserProfileAchievementsViewModel]
    ) {
        skillsCount = cursus.skills.count
        projectsCount = projects.count
        achievementsCount = achievements.count
        makeConstraints()
        userHeaderView.configure(
            login: cursus.login,
            profileIcon: profileIcon,
            joined: cursus.joined,
            grade: cursus.grade,
            cursus: cursus.cursusName
        )
        userInfoView.configure(campus: campus, email: cursus.email, phone: cursus.phone)
        userPointsView.configure(points: cursus.points, wallet: cursus.wallet)
        userLocationView.configure(location: cursus.location)
        userProgressView.configure(level: cursus.userLevel, progress: cursus.progress)
        userSkillsView.configure(with: cursus.skills)
        userProjectView.configure(with: projects)
        userAchievementsView.configure(with: achievements)
    }
    
    func updateCursus(_ cursus: UserProfileCursusViewModel) {
        skillsCount = cursus.skills.count
        makeConstraints()
        userHeaderView.configure(
            login: cursus.login,
            joined: cursus.joined,
            grade: cursus.grade,
            cursus: cursus.cursusName
        )
        userInfoView.configure(email: cursus.email, phone: cursus.phone)
        userPointsView.configure(points: cursus.points, wallet: cursus.wallet)
        userLocationView.configure(location: cursus.location)
        userProgressView.configure(level: cursus.userLevel, progress: cursus.progress)
        userSkillsView.configure(with: cursus.skills)
    }
}

private extension UserProfileView {
    func addSubviews() {
        addSubview(userHeaderView)
        addSubview(userInfoView)
        addSubview(userLocationView)
        addSubview(userPointsView)
        addSubview(userProgressView)
        addSubview(userSkillsView)
        addSubview(userProjectView)
        addSubview(userAchievementsView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.deactivate(viewConstraints)
        let basicInset: CGFloat = 20
        var skillsViewHeight: CGFloat = 0
        var projectViewHeight: CGFloat = 0
        var achievementsViewHeight: CGFloat = 0
        if skillsCount > 0 {
            skillsViewHeight = CGFloat(skillsCount * 31 + 30)
        }
        if projectsCount > 0 {
            projectViewHeight = CGFloat(projectsCount * 30 + 30)
            if projectViewHeight > 330 {
                projectViewHeight = 330
            }
        }
        if achievementsCount > 0 {
            achievementsViewHeight = CGFloat(achievementsCount * 70)
            if achievementsViewHeight > 330 {
                achievementsViewHeight = 330
            }
        }
        viewConstraints = [
            userHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: basicInset),
            userHeaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userInfoView.topAnchor.constraint(equalTo: userHeaderView.bottomAnchor, constant: basicInset),
            userInfoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: basicInset),
            userInfoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -basicInset),
            
            userLocationView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: basicInset),
            userLocationView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: basicInset),
            userLocationView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -basicInset),
            
            userPointsView.topAnchor.constraint(equalTo: userLocationView.bottomAnchor, constant: basicInset),
            userPointsView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: basicInset),
            userPointsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -basicInset),
            
            userProgressView.topAnchor.constraint(equalTo: userPointsView.bottomAnchor, constant: 5),
            userProgressView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: basicInset),
            userProgressView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -basicInset),
            
            userSkillsView.heightAnchor.constraint(equalToConstant: skillsViewHeight),
            userSkillsView.topAnchor.constraint(equalTo: userProgressView.bottomAnchor, constant: basicInset),
            userSkillsView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: basicInset),
            userSkillsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -basicInset),
            
            userProjectView.heightAnchor.constraint(equalToConstant: projectViewHeight),
            userProjectView.topAnchor.constraint(equalTo: userSkillsView.bottomAnchor, constant: basicInset),
            userProjectView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: basicInset),
            userProjectView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -basicInset),
            
            
            userAchievementsView.heightAnchor.constraint(equalToConstant: achievementsViewHeight),
            userAchievementsView.topAnchor.constraint(equalTo: userProjectView.bottomAnchor, constant: basicInset),
            userAchievementsView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: basicInset),
            userAchievementsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -basicInset),
            userAchievementsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(viewConstraints)
    }
}
