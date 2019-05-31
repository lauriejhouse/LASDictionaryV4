//
//  MainTabBarController.swift
//  LASDictionaryV3
//
//  Created by Jackie on 5/8/19.
//  Copyright © 2019 LAS. All rights reserved.
//


/*
 
 THINGS TO DO FOR PROGMATIC RESTRUCTURE.
 
 1. Going to have to get video view up and going and firebase stuff back up and running.
 2. OED API? Cross reference whats in FM vs OED? - in the excel sheet words with descritpion are in the database. Figure out how to seperate the two. CSV for LAS signs/words. API for the OED other. - But i need to get rid of duplicates/figure out which are duplicates
    Remove all Words that don't have a descritpoin from excel file - those are the OED words. Use JSON for LAS words. And AlamoFire and OED API 

 3.
 
 */


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
            generateNavigationController(for: ViewController(), title: "Dictionary", image: #imageLiteral(resourceName: "downloads")),
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
