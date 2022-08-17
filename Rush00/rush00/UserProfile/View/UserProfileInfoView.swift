//
//  UserProfileInfoView.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileInfoView: UIView {
    
    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var campusView: UserProfileTextAndImageView = {
        let view = UserProfileTextAndImageView(image: "Campus")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var emailView: UserProfileTextAndImageView = {
        let view = UserProfileTextAndImageView(image: "Email")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var numberView: UserProfileTextAndImageView = {
        let view = UserProfileTextAndImageView(image: "Phone")
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
    
    func configure(campus: String, email: String, phone: String) {
        campusView.setTitle(title: campus)
        emailView.setTitle(title: email)
        numberView.setTitle(title: phone)
    }
    
    func configure(email: String, phone: String) {
        emailView.setTitle(title: email)
        numberView.setTitle(title: phone)
    }
}

private extension UserProfileInfoView {
    func addSubviews() {
        addSubview(userInfoStackView)
        userInfoStackView.addArrangedSubview(campusView)
        userInfoStackView.addArrangedSubview(emailView)
        userInfoStackView.addArrangedSubview(numberView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                userInfoStackView.topAnchor.constraint(equalTo: topAnchor),
                userInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                userInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                userInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
    }
}
