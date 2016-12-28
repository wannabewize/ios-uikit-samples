//
//  ViewController.swift
//  CellSelect
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var data : [String]!
    
    // 선택된 셀 데이터
    @IBAction func showSelectedCell(_ sender: Any) {
        if let indexPathList = tableView.indexPathsForSelectedRows {
            print("선택된 힝목")
            for indexPath in indexPathList {
                print("\(data[indexPath.row])")
            }
        }
    }
    
    // 임의의 셀 선택
    @IBAction func selectRandomCell(_ sender: Any) {
        let r = Int(arc4random_uniform( UInt32(data.count)) )
        let indexPath = IndexPath(row: r, section: 0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
    }
    
    // 선택된 셀 초기화
    @IBAction func clearSelection(_ sender: Any) {
        if let indexPathList = tableView.indexPathsForSelectedRows {
            for indexPath in indexPathList {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for:indexPath)
        let itemName = data[indexPath.row]
        cell.textLabel?.text = itemName
        let image = UIImage(named: "\(itemName).png")
        cell.imageView?.image = image
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 여러개 선택 가능
        tableView.allowsMultipleSelection = true
        
        data = ["Baseball",
                "Basketball",
                "Football",
                "Golf",
                "Rugby",
                "Shuttlecock",
                "Tennis",
                "Volleyball",
                "TableTennis",
                "IceHockey",
                "Billiard"]
    }
}

