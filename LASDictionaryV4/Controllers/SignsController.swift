//
//  SignsController.swift
//  LASDictionaryV4
//
//  Created by Jackie on 6/12/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit



class SignsController: UITableViewController {
    
    var signs: Dictionary? {
        didSet {
            navigationItem.title = signs?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
