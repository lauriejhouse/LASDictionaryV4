//
//  OEDAPI.swift
//  LASDictionaryV4
//
//  Created by Jackie on 6/4/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import Foundation

class OEDapi {
    
    
    //MARK : - OED API
    
    // TODO: replace with your own app id and app key
    let appId = "8f4f181d"
    let appKey = "4190316dcb0072a2b1e8a7e54e5ae3d9"
    let language = "en-gb"
    lazy var word = "Ace"
    let fields = "pronunciations"
    let strictMatch = "false"
    lazy var word_id = word.lowercased()
    lazy var url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v2/entries/\(language)/\(word_id)?fields=\(fields)&strictMatch=\(strictMatch)")!
    lazy var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "8f4f181d")
        request.addValue(appKey, forHTTPHeaderField: "4190316dcb0072a2b1e8a7e54e5ae3d9")
    
    let session = URLSession.shared
    _ = session.dataTask(with: request, completionHandler: { data, response, error in
    if let response = response,
    let data = data,
    let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
    print(response)
    print(jsonData)
    } else {
    print(error)
    print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue))
    }
    }).resume()
}
