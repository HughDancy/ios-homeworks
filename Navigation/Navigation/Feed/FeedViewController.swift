//
//  FeedViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 28.11.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK: - Subview's
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var buttonOne = createButton(
        conf: UIButton.Configuration.filled(),
        title: "Push me",
        color: .magenta,
        radius: 15,
        clipToBounds: true)
    
    private lazy var buttonTwo = createButton(
        conf: UIButton.Configuration.filled(),
        title: "PUSH ME!!!",
        color: .systemIndigo,
        radius: 15,
        clipToBounds: true)
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        
        buttonOne.addTarget(self, action: #selector(goToNewViewController), for: .touchDown)
        buttonTwo.addTarget(self, action: #selector(goToNewViewController), for: .touchDown)
        
        view.backgroundColor = .systemRed
        title = "Feed"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Setup Hierarchy
    
    private func setupHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
    }
    
    //MARK: - Button Action
    
    @objc private func goToNewViewController() {
        let postView = PostViewController()
        navigationController?.pushViewController(postView, animated: true)
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}
