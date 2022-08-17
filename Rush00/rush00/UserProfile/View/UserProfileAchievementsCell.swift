//
//  UserProfileAchievementsCell.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileAchievementsCell: UITableViewCell {
    
    private lazy var achievementsName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var achievementsDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var tierStackView: UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var achievementsTier: TierView = {
        let label = TierView()
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    func configure(with viewModel: UserProfileAchievementsViewModel) {
        achievementsName.text = viewModel.name
        achievementsDescription.text = viewModel.description
        achievementsTier.configure(with: viewModel.tier)
    }
}

private extension UserProfileAchievementsCell {
    func addSubviews() {
        addSubview(achievementsName)
        addSubview(achievementsDescription)
        addSubview(tierStackView)
        tierStackView.addArrangedSubview(achievementsTier)
    }

    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                achievementsName.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                achievementsName.leadingAnchor.constraint(equalTo: leadingAnchor),
                achievementsName.trailingAnchor.constraint(equalTo: tierStackView.leadingAnchor),
                
                achievementsDescription.topAnchor.constraint(equalTo: achievementsName.bottomAnchor, constant: 16),
                achievementsDescription.leadingAnchor.constraint(equalTo: leadingAnchor),
                achievementsDescription.trailingAnchor.constraint(equalTo: tierStackView.leadingAnchor),
                achievementsDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
                
                tierStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                tierStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        )
    }
}

// MARK: - TierView

private final class TierView: UIView {
    private lazy var tierLaber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
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
    
    func configure(with tier: String) {
        if tier.contains("easy") {
            isHidden = false
            backgroundColor = TierColor.bronze
            tierLaber.text = "bronze"
        } else if tier.contains("medium") {
            isHidden = false
            backgroundColor = TierColor.silver
            tierLaber.text = "silver"
        } else if tier.contains("hard") {
            isHidden = false
            backgroundColor = TierColor.gold
            tierLaber.text = "gold"
        } else {
            isHidden = true
        }
    }
}

private extension TierView {
    func addSubviews() {
        addSubview(tierLaber)
    }

    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                tierLaber.centerXAnchor.constraint(equalTo: centerXAnchor),
                tierLaber.centerYAnchor.constraint(equalTo: centerYAnchor),
                heightAnchor.constraint(equalToConstant: 20),
                widthAnchor.constraint(equalToConstant: 80)
            ]
        )
    }
}

private enum TierColor {
    static let bronze = UIColor(red: 0.58, green: 0.35, blue: 0.13, alpha: 1.00)
    static let silver = UIColor(red: 0.79, green: 0.83, blue: 0.84, alpha: 1.00)
    static let gold = UIColor(red: 0.73, green: 0.68, blue: 0.39, alpha: 1.00)
}
