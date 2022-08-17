//
//  UserProfileProjectCell.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileProjectCell: UITableViewCell {
    
    private lazy var projectNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()

    private lazy var projectValidatedImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var projectMarkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
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
    
    func configure(with viewModel: UserProfileProjectViewModel) {
        projectNameLabel.text = viewModel.projectName
        projectMarkLabel.text = viewModel.finalMark
        if viewModel.validated {
            projectValidatedImage.image = UIImage(named: "success")
        } else {
            projectValidatedImage.image = UIImage(named: "fail")
        }
    }
}

private extension UserProfileProjectCell {
    func addSubviews() {
        addSubview(projectNameLabel)
        addSubview(projectMarkLabel)
        addSubview(projectValidatedImage)
    }

    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                projectNameLabel.topAnchor.constraint(equalTo: topAnchor),
                projectNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                projectNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                projectMarkLabel.topAnchor.constraint(equalTo: topAnchor),
                projectMarkLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                projectMarkLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                projectValidatedImage.heightAnchor.constraint(equalToConstant: 21),
                projectValidatedImage.widthAnchor.constraint(equalToConstant: 21),
                projectValidatedImage.centerYAnchor.constraint(equalTo: centerYAnchor),
                projectValidatedImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42),
            ]
        )
    }
}

