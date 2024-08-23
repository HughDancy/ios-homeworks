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
        navigationController?.navigationBar.isHidden = true
        postTable.reloadData()
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
        postTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

//MARK: - TableView Extension

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = PhotosTableViewCell()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! PostTableViewCell
            cell.cellIndex = indexPath.row
            cell.titleLabel.text = posts[indexPath.row].title
            cell.image.image = UIImage(named: posts[indexPath.row].image)
            cell.likes.text = "Likes: \(posts[indexPath.row].likes)"
            cell.postText.text = posts[indexPath.row].briefDescription
            cell.views.text = "Views: \(posts[indexPath.row].views)"
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! ProfileHeaderView
        return section == 0 ? headerView : nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FeedPostViewController()
        vc.configurateContent(with: indexPath.row)
        let nc =  UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        navigationController?.present(nc, animated: true)
        posts[indexPath.row].views += 1
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) {  (contextualAction, view, boolValue) in
            posts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            boolValue(true)
        }
        
        deleteAction.backgroundColor = .systemGray6
        deleteAction.image = UIImage(named: "deleteIcon")
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeActions.performsFirstActionWithFullSwipe = true
        
        if indexPath.section == 1 {
            return swipeActions
        } else {
            let swipeNonAction = UISwipeActionsConfiguration()
            return swipeNonAction
        }
    }
}

extension ProfileViewController: TapLike {
    func toTap() {
        postTable.reloadData()
        
    }
}
