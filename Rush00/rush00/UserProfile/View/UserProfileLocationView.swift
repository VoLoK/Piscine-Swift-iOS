//
//  UserProfileLocationView.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileLocationView: UIView {
    
    private let locationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private let availabilityTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "PingFangHK-Semibold", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let localitonTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "PingFangHK-Medium", size: 21)
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
    
    func configure(location: String?) {
        if let location = location {
            availabilityTitleLabel.text = "Available"
            localitonTitleLabel.text = location
        } else {
            availabilityTitleLabel.text = "Unavailable"
            localitonTitleLabel.text = "-"
        }
    }
}

private extension UserProfileLocationView {
    func addSubviews() {
        addSubview(locationStackView)
        locationStackView.addArrangedSubview(availabilityTitleLabel)
        locationStackView.addArrangedSubview(localitonTitleLabel)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                locationStackView.topAnchor.constraint(equalTo: topAnchor),
                locationStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                locationStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                locationStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
    }
}
