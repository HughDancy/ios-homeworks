//
//  InfoViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 28.11.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    //MARK: - Subview's
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Oh, you're still here?"
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 50
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(showAllertController), for: .touchDown)
        
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        setupHierarchy()
        setupLayout()
        buttonSetup()
    }
    
    //MARK: - Setup Hierarchy
    
    private func setupHierarchy() {
        view.addSubview(label)
        view.addSubview(button)
    }
    
    //MARK: - Button settings
    
    private func buttonSetup() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Warning!"
        
        button.configuration = configuration
    }
    
    //MARK: - Button action
    
    @objc func showAllertController() {
        let allert = UIAlertController(title: "Warning", message: "You went to the wrong neighbourhood", preferredStyle: .alert)
        let goAway = UIAlertAction(title: "Go away quickly", style: .cancel)
        let what = UIAlertAction(title: "What are you talking", style: .default)
        
        allert.addAction(goAway)
        allert.addAction(what)
        
        present(allert, animated: true, completion: nil)
    }
    
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}
