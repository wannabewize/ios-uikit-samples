//
//  ViewController.swift
//  TableAndSearchController
//
//  Created by wannabewize on 2017. 2. 6..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    var data = [String]()
    var searchResult = [String]()
    
    var tableView : UITableView!
    var searchController : UISearchController!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResult.count
        }
        else {
            return data.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        if searchController.isActive {
            cell.textLabel!.text = searchResult[indexPath.row]
        }
        else {
            cell.textLabel!.text = data[indexPath.row]
        }
        
        return cell
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        print("didDismissSearchController")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        print("didPresentSearchController")
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        print("willDismissSearchController")
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        print("willPresentSearchController")
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text!
        print("updateSearchResults : \(keyword)")
        
        searchResult.removeAll()
        searchItem(keyword)
        tableView.reloadData()
    }
    
    // 검색 버튼
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
        searchBar.resignFirstResponder()
        
        searchResult.removeAll()
        
        if let keyword = searchBar.text {
            searchItem(keyword)
            tableView.reloadData()
        }
    }
    
    func searchItem(_ keyword : String) {
        searchResult = data.filter { (item) in
            return item.range(of: keyword) != nil
        }
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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[table]|", options: [], metrics: nil, views: ["table":tableView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[guide][table]|", options: [], metrics: nil, views: ["guide":self.topLayoutGuide, "table":tableView]))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        
        // 같은 뷰에 검색 결과 출력하려면 nil
        searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        
        // 배경 어두어지기
        searchController.dimsBackgroundDuringPresentation = true
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

