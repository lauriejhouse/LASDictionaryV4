//
//  signCell.swift
//  LASDictionaryV4
//
//  Created by Jackie Norstrom on 6/7/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit


class signCell: UITableViewCell {
    
    var signs: Dictionary! {
        didSet {
             signLabel.text = signs.name
        }
    }
    
    
    @IBOutlet weak var signLabel: UILabel!
    
    
    
}
