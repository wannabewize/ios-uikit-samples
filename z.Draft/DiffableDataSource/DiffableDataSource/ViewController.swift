//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by Jaehoon Lee on 2022/10/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let dataSource = UITableViewDiffableDataSource(tableView: tableView) { ( tableView, indexPath, itemIdentifier ) -> UITableViewCell in
            
            let cell = UITableViewCell()
            return cell
        }

    }


}

