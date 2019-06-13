//
//  Dictionary.swift
//  LASDictionaryV3
//
//  Created by Jackie on 4/24/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import Foundation

//*** Going to have to also implement the LBTA youtube project, with the podcast project to get every function/thing needed for the dictionary app.

struct Dictionary {
    
    let name: String
    let signId: Int
    //don't need description later down the line - comment out later. But I do need the video/picture. But not for the search preview thing. 5/30/19 - changed description to signID: Int
    
    
    // do i need to init?
    init(name: String, signId: Int) {
        self.name = name
        self.signId = signId
        
    }
}
