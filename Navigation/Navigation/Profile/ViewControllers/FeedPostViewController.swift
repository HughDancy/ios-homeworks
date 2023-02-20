//
//  PostViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 13.02.2023.
//

import UIKit

class FeedPostViewController: UIViewController {
    
    //MARK: - Subview's
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.bounces = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let titleOfNews: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        label.textColor = .black
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        
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
        textView.showsVerticalScrollIndicator = false
        textView.isScrollEnabled = false
        
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
        setBottomConstraintScroll()
    }
    
    //MARK: - SetupHierarchy
    
    private func setupHierarchy() {
        
        contentView.addSubview(titleOfNews)
        contentView.addSubview(imageOfNews)
        contentView.addSubview(textOfNews)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
    }
    
    //MARK: - SetupLayout
    
    private func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        
        titleOfNews.translatesAutoresizingMaskIntoConstraints = false
        titleOfNews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1).isActive = true
        titleOfNews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleOfNews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        imageOfNews.translatesAutoresizingMaskIntoConstraints = false
        imageOfNews.topAnchor.constraint(equalTo: titleOfNews.bottomAnchor, constant: 10).isActive = true
        imageOfNews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageOfNews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageOfNews.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        textOfNews.translatesAutoresizingMaskIntoConstraints = false
        textOfNews.topAnchor.constraint(equalTo: imageOfNews.bottomAnchor, constant: 5).isActive = true
        textOfNews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        textOfNews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    //MARK: - Constraint for bottom ScrollView
    
    func setBottomConstraintScroll() {
        let bottomConstrint = NSLayoutConstraint.init(item: (self.textOfNews),
                                                      attribute: .bottom,
                                                      relatedBy: .equal,
                                                      toItem: (scrollView),
                                                      attribute: .bottom,
                                                      multiplier: 1.0,
                                                      constant: 0)
        bottomConstrint.isActive = true
    }
    
    //MARK: - Configure Content
    
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
