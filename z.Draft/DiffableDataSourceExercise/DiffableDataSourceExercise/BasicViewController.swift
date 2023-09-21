//
//  ViewController.swift
//  DiffableDataSourceExercise
//
//  Created by Jaehoon Lee on 2023/09/18.
//

import UIKit

class BasicViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    struct Item: Hashable {
        let id: Int
        let value: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Section Type : Int
        // Item Type
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        
        
        snapshot.appendSections([1])
        snapshot.appendItems(["a", "b", "c", "d"])
        
        print("numberOfItems :", snapshot.numberOfItems)
        
        
        var snapshot2 = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot2.appendSections([.main])
        snapshot2.appendItems([
            Item(id: 0, value: "가"),
            Item(id: 1, value: "나")
        ], toSection: .main)
        
        print("numberOfItems :", snapshot2.numberOfItems)
    }
}

