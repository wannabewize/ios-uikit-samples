//
//  ViewController.swift
//  TableAndSearch
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [String]()
    var searchResult = [String]()
    var isSearching = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchResult.count
        }
        else {
            return data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        if isSearching {
            cell.textLabel!.text = searchResult[indexPath.row]
        }
        else {
            cell.textLabel!.text = data[indexPath.row]
        }
        
        return cell
    }
    
    // 검색 버튼
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
        searchBar.resignFirstResponder()
        
        searchResult.removeAll()
        
        if let keyword = searchBar.text {
            isSearching = true
            searchItem(keyword)
            tableView.reloadData()
        }
    }
    
    func searchItem(_ keyword : String) {
        for item in data {
            if item.range(of: keyword) != nil {
                searchResult.append(item)
            }
        }
    }

    // 취소 버튼
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        isSearching = false
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...100 {
            data.append("item \(i)")
        }
    }
}

