//
//  FeedViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 28.11.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK: - Subview's
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(goToNewViewController), for: .touchDown)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        setupLayout()
        setupButton()
        
        view.backgroundColor = .systemRed
        title = "Feed"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Button settings
    
    private func setupButton() {
        var settings = UIButton.Configuration.filled()
        settings.title = "Push me"
        settings.baseBackgroundColor = .systemOrange
        
        button.configuration = settings
    }
    
    //MARK: - Button Action
    
    @objc private func goToNewViewController() {
        let postView = PostViewController()
        navigationController?.pushViewController(postView, animated: true)
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    
    
}
