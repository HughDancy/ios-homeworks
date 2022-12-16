//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 28.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Subview's
    
    let profileHeaderView = ProfileHeaderView()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        buttonSettings()
        view.backgroundColor = .lightGray
        title = "Profile"
        
    }
    
    //MARK: - Setup Hierarchy
    
    private func setupHierarchy() {
        view.addSubview(profileHeaderView)
        view.addSubview(button)
    }
    
    //MARK: - Button settings
    
    private func buttonSettings() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Change title (?)"
        configuration.baseBackgroundColor = .red
        
        button.configuration = configuration
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        profileHeaderView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
