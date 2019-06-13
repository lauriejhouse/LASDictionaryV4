//
//  signCell.swift
//  LASDictionaryV4
//
//  Created by Jackie Norstrom on 6/7/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

//Do i even need to make things work this way when they worked fine before? 

class signCell: UITableViewCell {
    
    @IBOutlet weak var signLabel: UILabel!
    
    
    var signs: Dictionary! {
        didSet {
             signLabel.text = signs.name
            signLabel.numberOfLines = 0
            signLabel.textColor = UIColor(red: 0/255, green: 102/255, blue: 204/255, alpha: 1.0)

        }


    }
    

    
}
