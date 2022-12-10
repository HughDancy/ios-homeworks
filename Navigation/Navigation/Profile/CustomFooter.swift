//
//  CustomFooter.swift
//  Navigation
//
//  Created by Борис Киселев on 07.12.2022.
//

import UIKit

class CustomFooter: UITableViewHeaderFooterView {
    
    private let identifier = "footer"
    
    //MARK: - Subview's
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.red
        
        return button
    }()
    
   //MARK: - Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Some error")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

}
