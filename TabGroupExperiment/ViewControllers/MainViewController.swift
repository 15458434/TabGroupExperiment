//
//  MainViewController.swift
//  TabGroupExperiment
//
//  Created by Mark Cornelisse on 18/11/2024.
//

import UIKit

final class MainViewController: UITabBarController {
    
    
    // MARK: UITabBarController
    
    // MARK: UITabBarDelegate
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("Tab selected: \(item.title ?? "")")
//    }
    
    // MARK: UIViewController
    
    override func loadView() {
        self.mode = .tabSidebar
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the view controllers
        let firstTab = UITab(title: "First", image: UIImage(systemName: "1.circle"), identifier: "1") { tab in
            FirstViewController()
        }
        
        let secondTab = UITab(title: "Second", image: UIImage(systemName: "2.circle"), identifier: "2") { tab in
            SecondViewController()
        }
        
        let thirdTab = UITab(title: "Third", image: UIImage(systemName: "3.circle"), identifier: "3") { tab in
            ThirdViewController()
        }
        
        let fourthTab = UITabGroup(title: "Fourth", image: UIImage(systemName: "4.circle"), identifier: "4", children: [secondTab, thirdTab]) { tab in
            let tabGroup = tab as! UITabGroup
            let tabs = tabGroup.children
            let tabBarController = NestedTabsViewController(tabs: tabs)
            let navigationController = UINavigationController(rootViewController: tabBarController)
            return navigationController
        }
        let tabs = [firstTab, fourthTab]
        self.setTabs(tabs, animated: false)
    }
    
    // MARK: UIResponder
    
    // MARK: NSObject
}
