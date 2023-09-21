//
//  EidtableTableViewController.swift
//  DiffableDataSourceExercise
//
//  Created by Jaehoon Lee on 2023/09/21.
//

import UIKit

class EditableTableViewController: UITableViewController {
    
    enum Section {
        case main
    }
    
    var dataSource: EditableTableDataSource!
    // 데이터 추가를 위한 마지막 값
    var lastItem = 5
    
    class EditableTableDataSource: UITableViewDiffableDataSource<Section, Int> {
        // 셀 이동
        override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            guard let sourceItem = itemIdentifier(for: sourceIndexPath),
                  let destinationItem = itemIdentifier(for: destinationIndexPath) else {
                fatalError("WTF")
            }
            
            var snapshot = snapshot()
            snapshot.moveItem(sourceItem, afterItem: destinationItem)
            self.apply(snapshot)
        }
        
        // 셀 삭제를 이용한 데이터 삭제
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            guard let target = itemIdentifier(for: indexPath) else {
                fatalError("WTF")
            }
            
            var snapshot = snapshot()
            snapshot.deleteItems([target])
            self.apply(snapshot)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = EditableTableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
            cell.textLabel?.text = "\(item)"
            return cell
        })
        
        // 초기값
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems( Array(0...lastItem), toSection: .main)
        dataSource.apply(snapshot)
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(toggleEditMode))
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        self.navigationItem.rightBarButtonItems = [addButton, editButton]
    }
    
    @objc func toggleEditMode() {
        self.isEditing.toggle()
    }
    
    @objc func addItem() {
        var snapshot = dataSource.snapshot()
        lastItem += 1
        snapshot.appendItems([lastItem], toSection: .main)
        dataSource.apply(snapshot)
    }
}
