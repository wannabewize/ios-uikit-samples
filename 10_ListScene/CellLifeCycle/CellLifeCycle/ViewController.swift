//
//  ViewController.swift
//  CellLifeCycle
//
//  Created by wannabewize on 2017. 2. 5..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit

class CustomCell : UITableViewCell {
    override func awakeFromNib() {
        print("awake From Nib")
    }
    
    override func prepareForReuse() {
        print("prepareForReuse")
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Will Display Cell : \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Did End Display Cell : \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        print("cellForRowAt : \(indexPath.row)")
        cell.textLabel!.text = "Cell \(indexPath.row)"
        return cell
    }
}

