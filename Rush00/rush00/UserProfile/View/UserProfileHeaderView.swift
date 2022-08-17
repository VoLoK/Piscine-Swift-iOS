//
//  UserProfileHeaderView.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileHeaderView: UIView {
    
    private lazy var nickLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "PingFangHK-Semibold", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "defaultUserIcon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 100
        return imageView
    }()
    
    private lazy var joinedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "PingFangHK-Light", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var gradeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "PingFangHK-Light", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cursusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "PingFangHK-Light", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    func configure(login: String,
                   profileIcon: Data? = nil,
                   joined: String?,
                   grade: String?,
                   cursus: String?
    ) {
        nickLabel.text = login
        if let iconData = profileIcon {
            iconImageView.image = UIImage(data: iconData)
        }
        if let joined = joined {
            joinedLabel.text = joined
        }
        if let grade = grade {
            gradeLabel.text = grade
        }
        if let cursus = cursus {
            cursusLabel.text = cursus
        }
    }
}

private extension UserProfileHeaderView {
    func addSubviews() {
        addSubview(nickLabel)
        addSubview(iconImageView)
        addSubview(joinedLabel)
        addSubview(gradeLabel)
        addSubview(cursusLabel)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                nickLabel.topAnchor.constraint(equalTo: topAnchor),
                nickLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                iconImageView.topAnchor.constraint(equalTo: nickLabel.bottomAnchor, constant: 10),
                iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                iconImageView.heightAnchor.constraint(equalToConstant: 200),
                iconImageView.widthAnchor.constraint(equalToConstant: 200),

                joinedLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor,constant: 10),
                joinedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

                gradeLabel.topAnchor.constraint(equalTo: joinedLabel.bottomAnchor),
                gradeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                cursusLabel.topAnchor.constraint(equalTo: gradeLabel.bottomAnchor),
                cursusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                cursusLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            ]
        )
    }
}
