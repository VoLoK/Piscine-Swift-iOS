//
//  UserProfileAchievementsView.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileAchievementsView: UIView {

    private var viewModels: [UserProfileAchievementsViewModel]?
    
    private lazy var projectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "PingFangHK-Semibold", size: 21)
        label.text = "Achievements"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.separatorStyle = .singleLine
        view.separatorColor = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 0.5)
        view.register(UserProfileAchievementsCell.self, forCellReuseIdentifier: "AchievementsCell")
        view.delegate = self
        view.dataSource = self
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
    
    func configure(with viewModels: [UserProfileAchievementsViewModel]) {
        self.viewModels = viewModels
    }
}

private extension UserProfileAchievementsView {
    func addSubviews() {
        addSubview(projectLabel)
        addSubview(tableView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                projectLabel.topAnchor.constraint(equalTo: topAnchor),
                projectLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                tableView.topAnchor.constraint(equalTo: projectLabel.bottomAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        )
    }
}

// MARK: - UITableViewDelegate

extension UserProfileAchievementsView: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension UserProfileAchievementsView: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementsCell", for: indexPath) as? UserProfileAchievementsCell,
              let models = viewModels else { return UITableViewCell() }
        cell.configure(with: models[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
}
