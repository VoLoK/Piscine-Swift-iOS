//
//  UserProfileProjectsView.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileProjectsView: UIView {
    
    private var viewModels: [UserProfileProjectViewModel]?
    
    private lazy var projectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "PingFangHK-Semibold", size: 21)
        label.text = "Projects"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.register(UserProfileProjectCell.self, forCellReuseIdentifier: "ProjectCell")
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
    
    func configure(with viewModels: [UserProfileProjectViewModel]) {
        self.viewModels = viewModels
    }
}

private extension UserProfileProjectsView {
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

extension UserProfileProjectsView: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension UserProfileProjectsView: UITableViewDataSource {
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as? UserProfileProjectCell,
              let models = viewModels else { return UITableViewCell() }
        cell.configure(with: models[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
}
