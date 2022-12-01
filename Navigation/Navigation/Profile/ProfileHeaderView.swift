//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Борис Киселев on 29.11.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    //MARK: - Subview's
    
    private lazy var image: UIImageView = {
        let picture = UIImageView()
        
        picture.layer.cornerRadius = 60
        picture.clipsToBounds = true
        picture.layer.borderWidth = 3
        picture.layer.borderColor = UIColor.white.cgColor
        
        let image = UIImage(named: "picture")
        picture.image = image
        picture.contentMode = .scaleAspectFill
        
        return picture
    }()
    
    private lazy var label: UILabel = {
       let label = UILabel()
        label.text = "Hipster cat"
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
       let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.textColor = .gray
        
        return label
    }()
    
    lazy var button: UIButton = {
        var button = UIButton(type: .system)
        
        button.layer.cornerRadius = 17
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
        button.isEnabled = true
        
        return button
    }()
    
    private lazy var shadowView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 17
        
        view.backgroundColor = .lightGray
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4
        
        return view
    }()

    //MARK: - Initial
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupHierarchy()
        setupLayout()
        buttonSetup()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(image)
        addSubview(label)
        addSubview(shadowView)
        addSubview(button)
        addSubview(statusLabel)
    }
    
    private func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        image.heightAnchor.constraint(equalToConstant: 120).isActive = true
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: 27).isActive = true
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        shadowView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: shadowView.heightAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: shadowView.widthAnchor).isActive = true
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: shadowView.topAnchor, constant: -34).isActive = true
    }
    
    private func buttonSetup() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Show status"
        
        button.configuration = configuration
    }
    
    //MARK: - Button Action
    
    @objc func printStatus() {
        print(statusLabel.text ?? "")
    }
}
