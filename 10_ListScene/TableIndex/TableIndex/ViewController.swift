//
//  ViewController.swift
//  TableIndex
//
//  Created by wannabewize on 2017. 2. 5..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data : [[String]]!
    var index : [String]!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return index
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let title = data[indexPath.section][indexPath.row]
        cell.textLabel!.text = title
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [
            ["Korea", "China", "Japan"],
            ["Korea", "China", "Japan"],
            ["Korea", "China", "Japan"],
            ["Korea", "China", "Japan"]
        ]
        
        index = ["As", "Eu", "Af", "Am"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

