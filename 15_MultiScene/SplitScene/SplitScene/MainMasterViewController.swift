//
//  MainMasterViewController.swift
//  SplitScene
//
//  Created by Jaehoon Lee on 2017. 1. 8..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit

class MainMasterViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
