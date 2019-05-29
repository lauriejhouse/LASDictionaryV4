//
//  MainTabBarController.swift
//  LASDictionaryV3
//
//  Created by Jackie on 5/8/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit



class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tabBar.tintColor = .purple
        UINavigationBar.appearance().prefersLargeTitles = true
        
        
        setupViewControllers()
        
        
        
    }
    
    //MARK: - Setup Functions
    
    func setupViewControllers() {
        
        viewControllers = [
            generateNavigationController(for: DictionarySearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(for: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
            generateNavigationController(for: ViewController(), title: "Dictionary", image: #imageLiteral(resourceName: "downloads"))
        ]
    }
    
    
    
    //MARK: - Helper Functions
    
    //can name 'for' keyword anything you want, for or with.
    fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        
        rootViewController.navigationItem.title = title
        //        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
    
    
    
    
    
    
    
    
    
    
}
