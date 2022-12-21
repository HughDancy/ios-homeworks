//
//  PhotoViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 20.12.2022.
//

import UIKit

class PhotoViewController: UIViewController {
    
    //MARK: - Subviews

    lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFit
        
        return photo
    }()
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(photo)
        setupLayout()
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        photo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        photo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
