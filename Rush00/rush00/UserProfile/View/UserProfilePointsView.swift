//
//  UserProfilePointsView.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfilePointsView: UIView {
    
    private lazy var evaluationView: UserProfileTextAndImageView = {
        let view = UserProfileTextAndImageView(image: "Evaluation")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var walletView: UserProfileTextAndImageView = {
        let view = UserProfileTextAndImageView(image: "Wallet")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pointsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .firstBaseline
        return stackView
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
    
    func configure(points: Int, wallet: Int) {
        evaluationView.setTitle(title: points.description)
        walletView.setTitle(title: wallet.description)
    }
}

private extension UserProfilePointsView {
    func addSubviews() {
        addSubview(pointsStackView)
        pointsStackView.addArrangedSubview(evaluationView)
        pointsStackView.addArrangedSubview(walletView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                pointsStackView.topAnchor.constraint(equalTo: topAnchor),
                pointsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                pointsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                pointsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
    }
}
