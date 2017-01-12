//
//  ViewController.swift
//  ItemSearch
//
//  Created by Jaehoon Lee on 2017. 1. 13..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView : UITableView!
    
    var items : [MKMapItem]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items == nil {
            return 0
        }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.placemark)"
        return cell
    }
    
    // 액서서리 버튼을 누르면 - 맵뷰아이템을 이용해서 지도로 전환
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let item = items[indexPath.row]
        item.openInMaps(launchOptions: nil)
    }
    
    // 검색 버튼 누르면 키보드 감추고 검색 시작
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let keyword = searchBar.text!
        search(keyword: keyword)
    }
    
    // 검색
    func search(keyword : String) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = keyword
        
        let search = MKLocalSearch(request: request)
        search.start { (response : MKLocalSearchResponse?, error : Error?) in
            guard error == nil else {
                print("Error : \(error?.localizedDescription)")
                return
            }
            
            self.items = response?.mapItems
            self.tableView.reloadData()
        }
    }
}

