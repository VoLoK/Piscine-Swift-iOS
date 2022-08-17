//
//  UserProfileSkillsCell.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileSkillsCell: UITableViewCell {

    private lazy var skillsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var skillsProgressView: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.trackTintColor = UIColor(red: 0.13, green: 0.13, blue: 0.15, alpha: 0.50)
        view.progressTintColor = UIColor(red: 0.00, green: 0.73, blue: 0.74, alpha: 1.00)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: UserProfileSkillsViewModel) {
        skillsLabel.text = viewModel.skillExperience
        skillsProgressView.progress = viewModel.progress
    }
}


private extension UserProfileSkillsCell {
    func addSubviews() {
        addSubview(skillsLabel)
        addSubview(skillsProgressView)
    }

    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                skillsLabel.topAnchor.constraint(equalTo: topAnchor),
                skillsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                skillsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                skillsProgressView.heightAnchor.constraint(equalToConstant: 10),
                skillsProgressView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor),
                skillsProgressView.leadingAnchor.constraint(equalTo: leadingAnchor),
                skillsProgressView.trailingAnchor.constraint(equalTo: trailingAnchor),
                skillsProgressView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
}

