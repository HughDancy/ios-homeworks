//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 28.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Subview's
    
    private lazy var postTable: UITableView =  {
        let table = UITableView(frame: .zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "customCell")
        table.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        table.backgroundColor = .systemGray6
        table.showsVerticalScrollIndicator = false
        
        return table
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
       
        view.backgroundColor = .systemGray6
        title = "Profile"
        
    }
    
    //MARK: - Setup Hierarchy
    
    private func setupHierarchy() {
        view.addSubview(postTable)
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        postTable.translatesAutoresizingMaskIntoConstraints = false
        postTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        postTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        postTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        postTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

  //MARK: - TableView Extension

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! PostTableViewCell
        cell.titleLabel.text = posts[indexPath.row].title
        cell.image.image = UIImage(named: posts[indexPath.row].image)
        cell.postText.text = posts[indexPath.row].description
        cell.likes.text = "Likes: \(posts[indexPath.row].likes)"
        cell.views.text = "Views: \(posts[indexPath.row].views)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! ProfileHeaderView
            return headerView
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}
