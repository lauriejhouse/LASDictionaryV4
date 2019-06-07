//
//  MainTabBarController.swift
//  LASDictionaryV4
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
 
 5. DUPILCATE SIGNS. SOME LOWERCASE, SOME PROPER CASE!
 
 6. ***If no video, have default image show of 'video coming soon'?
 
 7. Need to get Dicitonary tab up and running - can pull code from V2, or modify this code in V4.
 8. Need 'button'/tab to change to other languages???? I'm not sure if we were still doing this.
 9. Need seperate baby signs searchController and VC. Also need seperate JSON for that.
 10. Improve tab bar images to better reflect the LAS app, as well as a possible color scheme?
 
 11. ****Helpful/Useful to have audio description of signs for people that are auditory learners. Same for text description? Or will videos be clear enough?
 
 12. If doing other lagnuages/ for the different alphabets can use soemthing similar to LBTA podcast lesson 7; where it lists the podcast name and picture with how many episodes in each. the LAS version would list alphabet language, with how many 'words'/letters are in each one.
 
 13. Use swipe away navigation (Youtube LBTA) to go from playing video back to selection? Make the App cooler instead of with a standard back button.
 
 */


import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tabBar.tintColor = .blue
        UINavigationBar.appearance().prefersLargeTitles = true
        
        
        setupViewControllers()
        
        
        
    }
    
    //MARK: - Setup Functions
    
    func setupViewControllers() {
        
        viewControllers = [
            generateNavigationController(for: SearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(for: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
            generateNavigationController(for: ViewController(), title: "Dictionary", image: #imageLiteral(resourceName: "downloads")),
            generateNavigationController(for: ViewController(), title: "Baby Signs", image: #imageLiteral(resourceName: "max_volume"))
        ]
    }
    
    
    
    //MARK: - Helper Functions
    
    //can name 'for' keyword anything you want, for or with.
    fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
    
    
    
    
    
    
    
    
    
    
}
