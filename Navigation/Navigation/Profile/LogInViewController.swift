//
//  LogInViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 07.12.2022.
//

import UIKit

class LogInViewController: UIViewController {
    //MARK: - Subview's
    
    private lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.register(CustomLoginCell.self, forCellReuseIdentifier: "LoginCell")
        table.register(CustomFooter.self, forHeaderFooterViewReuseIdentifier: "footer")
        
//        let footer = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        footer.backgroundColor = .red
//        table.tableFooterView = footer
        
        return table
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let picture = UIImage(named: "vkIcon")
        imageView.image = UIImage(named: "vkIcon")
        
        return imageView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(named: "ColorSet")
        
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        buttonSettings()
    }
    
    //MARK: - Setup Hierarchy
    
    func tableSettings() {
        table.register(CustomLoginCell.self, forCellReuseIdentifier: "LoginCell")
    }
    
    private func setupHierarchy() {
        view.addSubview(imageView)
        view.addSubview(table)
        view.addSubview(button)
        
    }
    
    private func buttonSettings() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Log In"
        
        button.configuration = configuration
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        table.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: table.bottomAnchor, constant: 16).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}

   //MARK: - Table Extension

extension LogInViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginCell", for: indexPath) as! CustomLoginCell
        cell.selectionStyle = .none


        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 10

        
        cell.textField.placeholder = loginPlaceHOlders[indexPath.row]
        if cell.textField.placeholder == "Password" {
            cell.textField.isSecureTextEntry = true
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 150
    }
    
    
}



