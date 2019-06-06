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
    Remove all Words that don't have a descritpoin from excel file - those are the OED words. Use JSON for LAS words. And AlamoFire and OED API 6/2/19 - words are seperated. 6/4-2019 - Maybe not be able to use API because of client issues on OED API.


 3. I'LL NEED TO PULL THE FIREBASE/URL/PERCENTAGE CODE FROM V2 TO GET THE VIDEOS TO WORK.
 4. Need to seperate/pull the letters from the csv, and put them into another cvs. 
 

 
 
 
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
            generateNavigationController(for: SearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
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
