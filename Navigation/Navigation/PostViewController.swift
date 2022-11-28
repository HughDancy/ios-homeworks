//
//  PostViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 28.11.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        let post = Post(title: "Hello, there!")
        title = post.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let button = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(goToNewViewController))
        navigationItem.rightBarButtonItem = button
    }
    
    //MARK: - Button Action
    
    @objc private func goToNewViewController() {
        let viewController = InfoViewController()
        present(viewController, animated: true)
    }
}
