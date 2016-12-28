//
//  ViewController.swift
//  BasicTable
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var data : [String]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // 프로토타입 방식 반환값이 옵셔널이 아니다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath)
        
        let itemName = data[indexPath.row]
        cell.textLabel?.text = itemName
        let image = UIImage(named: "\(itemName).png")
        cell.imageView?.image = image
        return cell
 
        
        /*
        // 프로토타입 방식을 사용하지 않을 때
        // 옵셔널 반환이므로 강제 언래핑
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID")
        // 재사용 가능한 셀이 없으면
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CELL_ID")
        }

        let itemName = data[indexPath.row]
        cell!.textLabel?.text = itemName
        let image = UIImage(named: "\(itemName).png")
        cell!.imageView?.image = image

        return cell!
         */
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

