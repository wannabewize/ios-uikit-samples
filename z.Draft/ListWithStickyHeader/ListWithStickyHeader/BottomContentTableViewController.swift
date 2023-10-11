//
//  BottomContentTableViewController.swift
//  ListInStickyScrollView
//
//  Created by Jaehoon Lee on 10/11/23.
//

import UIKit

class BottomContentTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("super vc :", self.parent)
        if let parentVC = parent as? ViewController {
            parentVC.bottomScrollable = self.tableView
        }
    }
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = "Item \(indexPath.row)"
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            // bounce 효과 없앰.
            scrollView.contentOffset.y = 0
            (parent as? ViewController)?.isHeaderSticky = false
        }
    }
}
