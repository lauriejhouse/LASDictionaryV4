//
//  DictionarySearchController.swift
//  LASDictionaryV3
//
//  Created by Jackie on 4/24/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class SearchController: UITableViewController, UISearchBarDelegate {
    
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
        parseJSONSigns()
        self.definesPresentationContext = true
        setupTableView()
        
        //1. register a cell for tableview
        
        
    }
    
    
   
    func parseJSONSigns() {
        
        if let url = Bundle.main.url(forResource: "csvjson", withExtension: "json") {
            do {
                let date = Date()
                let data = try Data(contentsOf: url)
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                    (json["results"] as? [[String:Any]])?.forEach { j in
                        if let name = j["identifier"] as? String, let id = j["id"] as? Int {
                            
                            
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
    
    
    func setupTableView() {
        
        let nib = UINib(nibName: "SignCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredSigns.count
        }
        
            return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! signCell
        
        var dictionary = self.signsArray[indexPath.row]
        
        if inSearchMode {
                        dictionary = filteredSigns[indexPath.row]
                    } else {
                        dictionary = signsArray[indexPath.row]
                    }

        cell.signs = dictionary
        


        //OLD WAY OF DOING IT THAT WORKED. BEFORE ADDING SIGNCELL FILES.
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//
//        let dictionary: Dictionary
//
//        if inSearchMode {
//            dictionary = filteredSigns[indexPath.row]
//        } else {
//            dictionary = signsArray[indexPath.row]
//        }
//
//       let dictionary = self.signsArray[indexPath.row]
//        cell.textLabel?.text = dictionary.name
        
        
        
        return cell

    }
    
    
    
    
    
    // MARK: - Search Bar
    
    func searchBarIsEmpty() -> Bool {
        //Returns true if empty or nil
        
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredSigns = signsArray.filter({(signs : Dictionary) -> Bool in return signs.name.contains(searchText.lowercased())
            
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
            filteredSigns = signsArray.filter{$0.name.range(of: searchBar.text!, options: .caseInsensitive) != nil}
            
            tableView.reloadData()
        }
    }
    
    
    
}



