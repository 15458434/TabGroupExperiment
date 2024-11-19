//
//  ThirdViewController.swift
//  TabGroupExperiment
//
//  Created by Mark Cornelisse on 18/11/2024.
//

import UIKit

final class ThirdViewController: UIViewController {

    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        
        view = UIView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the label
        let label = UILabel()
        label.text = "Third"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the view
        view.addSubview(label)
        
        // Center the label in the view using Auto Layout
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: UIResponder
    
    // MARK: NSObject
}
