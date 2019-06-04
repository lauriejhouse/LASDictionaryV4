//
//  DictionarySearchController.swift
//  LASDictionaryV3
//
//  Created by Jackie on 4/24/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import Alamofire

class DictionarySearchController: UITableViewController, UISearchBarDelegate {

    
    var signsArray = [Dictionary]()
    var filteredSigns = [Dictionary]()
    var inSearchMode = false

    
    let cellId = "cellId"
    //UISearch Controller
    
    let searchController = UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        parseJSONSignDictionary()
        self.definesPresentationContext = true

        
        //1. register a cell for tableview
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    func parseJSONSignDictionary() {
        
        if let url = Bundle.main.url(forResource: "convertcsv", withExtension: "json") {
            do {
                let date = Date()
                let data = try Data(contentsOf: url)
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                    (json["results"] as? [[String:Any]])?.forEach { j in
                        if let name = j["Identifier"] as? String, let id = j["Id"] as? Int {
                            
                            
                            let sign = Dictionary(name: name, signId: id)
                            signsArray.append(sign)
                        }
                    }
                    
                }
                print("Took", Date().timeIntervalSince(date))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    //example from demo podcast App
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
//        //later implement alamofire with custom api? ****NEED TO MAKE MY OWN API**** - using JSON file and implimentation instead.
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredSigns.count
        }
        
        //        return signsArray.count. returning 0 makes it so only shows results when typing in the search box.
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let dictionary: Dictionary
        
        if inSearchMode {
            dictionary = filteredSigns[indexPath.row]
        } else {
            dictionary = signsArray[indexPath.row]
        }
        
//        let dictionary = self.signsArray[indexPath.row]
        cell.textLabel?.text = dictionary.name
        
        return cell
        

        
        
        
    }
    
    
    
    
    
    // MARK: - Search Bar
    
    func searchBarIsEmpty() -> Bool {
        //Returns true if empty or nil
        
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredSigns = signsArray.filter({(signs : Dictionary) -> Bool in return signs.name.lowercased().contains(searchText.lowercased())
            
        })
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            inSearchMode = true
            filteredSigns = signsArray.filter{$0.name.range(of: searchBar.text!) != nil}
            
            tableView.reloadData()
        }
        let url = "https://od-api.oxforddictionaries.com/api/v2/search/en-gb?q=\(searchText)"
            Alamofire.request(url).responseData { (dataResponse) in
               if let err = dataResponse.error {
                    print("Failed to contact yahoo", err)
                    return
                }
                
                guard let data = dataResponse.data else {
                    return
                }
                
                let dummyString = String(data: data, encoding: .utf8)
                print(dummyString ?? "") //called nil coalescing
                
        }
        //start adding alamofire stuff here? or it might go inside the 'else' statement. Because we'll be in 'inSearchMode'
        //https://od-api.oxforddictionaries.com/api/v2/search/en-gb?q=good%20luck - search example on OED API. May need to put in the thing that makes searching with spaces/% work, like in the v2 app.

        
    }
    
    
    
    
   
    
    
}



