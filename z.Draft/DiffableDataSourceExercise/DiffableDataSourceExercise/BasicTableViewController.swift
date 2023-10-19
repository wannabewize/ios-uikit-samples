//
//  BasicTableViewController.swift
//  DiffableDataSourceExercise
//
//  Created by Jaehoon Lee on 2023/09/21.
//

import UIKit

class BasicTableViewController: UITableViewController {
    var dataSource: UITableViewDiffableDataSource<Int, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellProvider: (UITableView, IndexPath, String) -> UITableViewCell = { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
            cell.textLabel?.text = item
            return cell
        }
                
        dataSource = UITableViewDiffableDataSource(tableView: self.tableView, cellProvider: cellProvider)

        // section 1개이고, 첫 번째 섹션의 id는 0이다.
        let section = 0
        var snapShot = NSDiffableDataSourceSnapshot<Int, String>()
        snapShot.appendSections([section])
        let items = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"]
        snapShot.appendItems(items, toSection: section)
        
        dataSource.apply(snapShot)
    }
}

#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "BasicTableScene")
    return vc
}
