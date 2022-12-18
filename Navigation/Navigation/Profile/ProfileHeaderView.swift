//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Борис Киселев on 29.11.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    let identifier = "header"
    
    var statusText = ""
    
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
        label.text = "Corey Taylor"
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
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Helvetica", size: 15)
        
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    //MARK: - Initial
    
    override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            setupHierarchy()
            setupLayout()
            buttonSetup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(image)
        addSubview(label)
        addSubview(shadowView)
        addSubview(button)
        addSubview(statusLabel)
        addSubview(textField)
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
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16).isActive = true
        textField.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        shadowView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: shadowView.heightAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: shadowView.widthAnchor).isActive = true
        
    }
    
    private func buttonSetup() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Set status"
        
        button.configuration = configuration
    }
    
    //MARK: - Button Action
    
    @objc func printStatus() {
        if statusText == "" {
            statusLabel.text = "Waiting for something..."
        } else {
            statusLabel.text = statusText
            print(statusLabel.text ?? "")
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
}
