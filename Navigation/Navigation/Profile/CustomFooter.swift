//
//  CustomFooter.swift
//  Navigation
//
//  Created by Борис Киселев on 07.12.2022.
//

import UIKit

class CustomFooter: UITableViewHeaderFooterView {
    
    private let identifier = "footer"
    //MARK: - Subviews
    
    let button: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(named: "ColorSet")
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        
        return button
    }()

    //MARK: - Button settings
    
    private func buttonSetup() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Log In"
        
        button.configuration = configuration
    }
    
    //MARK: - Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
        buttonSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        button.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(button)
   
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
