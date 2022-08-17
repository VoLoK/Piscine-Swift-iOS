//
//  UserProfileSkillsView.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileSkillsView: UIView {

    private var viewModels: [UserProfileSkillsViewModel]?
    
    private lazy var skillsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "PingFangHK-Semibold", size: 21)
        label.text = "Skills"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.register(UserProfileSkillsCell.self, forCellReuseIdentifier: "SkillsCell")
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
    
    func configure(with viewModels: [UserProfileSkillsViewModel]) {
        self.viewModels = viewModels
        tableView.reloadData()
    }
}

private extension UserProfileSkillsView {
    func addSubviews() {
        addSubview(skillsLabel)
        addSubview(tableView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                skillsLabel.topAnchor.constraint(equalTo: topAnchor),
                skillsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                tableView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        )
    }
}

// MARK: - UITableViewDelegate

extension UserProfileSkillsView: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension UserProfileSkillsView: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SkillsCell", for: indexPath) as? UserProfileSkillsCell,
              let models = viewModels else { return UITableViewCell() }
        cell.configure(with: models[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
}

