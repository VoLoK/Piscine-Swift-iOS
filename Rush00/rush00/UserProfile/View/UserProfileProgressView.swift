//
//  UserProfileProgressView.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import UIKit

final class UserProfileProgressView: UIView {
    
    private lazy var progressBar: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.trackTintColor = UIColor(red: 0.13, green: 0.13, blue: 0.15, alpha: 0.50)
        view.progressTintColor = UIColor(red: 0.00, green: 0.73, blue: 0.74, alpha: 1.00)
        return view
    }()
    
    private lazy var textInProgress: UILabel = {
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
    
    func configure(level: String, progress: Float) {
        textInProgress.text = level
        progressBar.progress = progress
    }
}

private extension UserProfileProgressView {
    func addSubviews() {
        addSubview(progressBar)
        progressBar.addSubview(textInProgress)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                progressBar.topAnchor.constraint(equalTo: topAnchor),
                progressBar.bottomAnchor.constraint(equalTo: bottomAnchor),
                progressBar.leadingAnchor.constraint(equalTo: leadingAnchor),
                progressBar.trailingAnchor.constraint(equalTo: trailingAnchor),
                progressBar.heightAnchor.constraint(equalToConstant: 20),
                
                textInProgress.centerXAnchor.constraint(equalTo: progressBar.centerXAnchor),
                textInProgress.centerYAnchor.constraint(equalTo: progressBar.centerYAnchor),
            ]
        )
    }
}
