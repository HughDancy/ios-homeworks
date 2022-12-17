//
//  CustomTabBarController.swift
//  Navigation
//
//  Created by Борис Киселев on 03.12.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        let profileVc = LogInViewController()
        let feedVc = FeedViewController()
        let firstNavigationController = UINavigationController(rootViewController: profileVc)
        let secondNavigationController = UINavigationController(rootViewController: feedVc)
        viewControllers = [
            generateVC(viewController: secondNavigationController,
                       title: "Feed",
                       image: UIImage(systemName: "archivebox")),
            generateVC(viewController: firstNavigationController,
                       title: "Profile",
                       image: UIImage(systemName: "person.fill"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let vc = viewController
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        
        return vc
    }

    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 15
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let cas = CAShapeLayer()
        
        let beizerPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        cas.path = beizerPath.cgPath
        tabBar.layer.insertSublayer(cas, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = . centered
        
        cas.fillColor = UIColor.white.cgColor
        
        tabBar.tintColor = .purple
        tabBar.unselectedItemTintColor = .systemIndigo
    }
}
