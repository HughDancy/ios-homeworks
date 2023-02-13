//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Борис Киселев on 17.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let identifier = "customCell"
    
    //MARK: - Subview's
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont(name: "Helvetica-Bold", size: 20)
        title.lineBreakMode = .byClipping
        title.numberOfLines = 2
        
        return title
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        
        return image
    }()
    
    lazy var postText: UITextView = {
        let postText = UITextView()
        postText.textColor = .systemGray
        postText.font = UIFont(name: "system", size: 14)
        postText.textAlignment = .left
        postText.isEditable = false
        postText.isScrollEnabled = false
        
        return postText
    }()
    
    lazy var likes: UILabel = {
        let likes = UILabel()
        var numbers = 0
        likes.text = "Likes: \(numbers)"
        likes.textColor = .black
        likes.font = UIFont(name: "system", size: 16)

        return likes
    }()
    
    lazy var views: UILabel =  {
        let views = UILabel()
        var numbers = 0
        views.text = "Views: \(numbers)"
        views.textColor = .black
        views.font = UIFont(name: "system", size: 16)
        
        return views
    }()
    
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: identifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(image)
        contentView.addSubview(postText)
        contentView.addSubview(likes)
        contentView.addSubview(views)
        
        self.selectionStyle = .none
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        postText.translatesAutoresizingMaskIntoConstraints = false
        postText.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16).isActive = true
        postText.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        postText.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        postText.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 20).isActive = true
        likes.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        likes.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
        views.translatesAutoresizingMaskIntoConstraints = false
        views.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 20).isActive = true
        views.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        views.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
