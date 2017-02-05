//
//  CodeViewController.swift
//  TableAndSearch
//
//  Created by wannabewize on 2017. 2. 6..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    var data = [String]()
    var searchResult = [String]()
    var isSearching = false
    
    var tableView : UITableView!
    
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

        tableView = UITableView()
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let searchBar = UISearchBar()
        tableView.tableHeaderView = searchBar
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[table]|", options: [], metrics: nil, views: ["table":tableView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[guide][table]|", options: [], metrics: nil, views: ["guide":self.topLayoutGuide, "table":tableView]))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
    }

}
