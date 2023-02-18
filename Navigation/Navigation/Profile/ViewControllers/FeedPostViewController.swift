//
//  PostViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 13.02.2023.
//

import UIKit

class FeedPostViewController: UIViewController {
    
    //MARK: - Subview's
    
    private let titleOfNews: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        label.textColor = .black
        label.lineBreakMode = .byClipping
        label.numberOfLines = 3
        
        return label
    }()
    
    private let imageOfNews: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let textOfNews: UITextView = {
       let textView = UITextView()
        textView.textAlignment = .justified
        textView.font = UIFont(name: "HelveticaNeue", size: 16.0)
        textView.textColor = .black
        
        return textView
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(getBack))
        navigationItem.leftBarButtonItem?.tintColor = .purple
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        
    }
    
    //MARK: - SetupHierarchy
    
    private func setupHierarchy() {
        view.addSubview(titleOfNews)
        view.addSubview(imageOfNews)
        view.addSubview(textOfNews)
    }
    
    //MARK: - SetupLayout
    
    private func setupLayout() {
        titleOfNews.translatesAutoresizingMaskIntoConstraints = false
        titleOfNews.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        titleOfNews.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleOfNews.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        imageOfNews.translatesAutoresizingMaskIntoConstraints = false
        imageOfNews.topAnchor.constraint(equalTo: titleOfNews.bottomAnchor, constant: 15).isActive = true
        imageOfNews.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageOfNews.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageOfNews.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        textOfNews.translatesAutoresizingMaskIntoConstraints = false
        textOfNews.topAnchor.constraint(equalTo: imageOfNews.bottomAnchor, constant: 15).isActive = true
        textOfNews.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        textOfNews.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        textOfNews.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
    }
    
    func configurateContent(with index: Int) {
        titleOfNews.text = posts[index].title
        imageOfNews.image = UIImage(named: posts[index].image)
        textOfNews.text = posts[index].description
    }

    //MARK: - Button action
    
    @objc func getBack() {
        dismiss(animated: true)
    }

}
