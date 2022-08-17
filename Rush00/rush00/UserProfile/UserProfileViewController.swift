//
//  UserProfileViewController.swift
//  rush00
//
//  Created by Clothor- on 8/17/22.
//

import Foundation
import UIKit

// MARK: - UserProfileViewController

final class UserProfileViewController: UIViewController {
    
    private var viewModel: UserProfileViewModel
    private var cursusPicker: UIAlertController?

    // MARK: - Lifecycle

    required init(with viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
        configureViews()
        makeCursusPicker()
    }

    private lazy var profileView: UserProfileView = {
        let view = UserProfileView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private lazy var cursusButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Cursus"
        button.style = .plain
        button.target = self
        button.action = #selector(presentCursusPicker)
        return button
    }()
    
    @objc func presentCursusPicker(_ sender: UIBarButtonItem) {
        guard let cursusPicker = cursusPicker else { return }
        present(cursusPicker, animated: true, completion: nil)
    }
}

// MARK: - Extension

private extension UserProfileViewController {
    func configureViews() {
        guard let cursus = viewModel.cursus.last else { return }
        self.navigationItem.title = cursus.userFullName
        if !viewModel.staff {
            navigationItem.rightBarButtonItem = cursusButtonItem
        }
        
        profileView.configure(
            campus: viewModel.campus,
            profileIcon: viewModel.profileIconData,
            cursus: cursus,
            projects: viewModel.projectsUsers,
            achievements: viewModel.achievements
        )
    }
    
    func addSubviews() {
        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(profileView)
    }

    func makeConstraints() {
        NSLayoutConstraint.activate(
            [
                scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
                scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                profileView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                profileView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                profileView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                profileView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ]
        )
    }
    
    func makeCursusPicker() {
        if viewModel.staff { return }
        let controller = UIAlertController(title: "Availiable Cursus", message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(cancel)
        
        for cursus in viewModel.cursus {
            guard let name = cursus.cursusName else { continue }
            let action = UIAlertAction(title: name, style: .default, handler: { [weak self] action in
                guard let self = self else { return }
                self.profileView.updateCursus(cursus)
            })
            controller.addAction(action)
        }
        cursusPicker = controller
    }
}
