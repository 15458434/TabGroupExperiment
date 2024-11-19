//
//  NestedTabsViewController.swift
//  TabGroupExperiment
//
//  Created by Mark Cornelisse on 18/11/2024.
//

import UIKit
import Combine

final class NestedTabsViewController: UITabBarController {
    private var myTabs: [UITab]
    
    private var bag = Set<AnyCancellable>()
    
    override init(tabs: [UITab]) {
        self.myTabs = tabs
        super.init(nibName: nil, bundle: nil)
        // Extract view controllers from the provided tabs
        let viewControllers = tabs.compactMap { tab -> UIViewController? in
            let viewController = tab.viewController
            viewController?.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, tag: 0)
            return viewController
        }
        
        self.viewControllers = viewControllers
        
    }
    
    // MARK: UITabBarController

    // MARK: UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myTabs.first?.managingTabGroup?.publisher(for: \.selectedChild, options: [.initial, .new])
            .compactMap({ $0?.viewController })
            .sink { [unowned self] selectedViewController in
                guard let index = self.viewControllers?.firstIndex(of: selectedViewController) else {
                    return
                }
                self.selectedIndex = index
            }
            .store(in: &bag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        bag.removeAll(keepingCapacity: true)
    }
    
    // MARK: NSCoding
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIResponder
    
    // MARK: NSObject
}
