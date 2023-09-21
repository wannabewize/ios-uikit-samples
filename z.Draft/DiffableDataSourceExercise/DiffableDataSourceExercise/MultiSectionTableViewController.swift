//
//  MultiSectionTableViewController.swift
//  DiffableDataSourceExercise
//
//  Created by Jaehoon Lee on 2023/09/21.
//

import UIKit

class MultiSectionTableViewController: UITableViewController {
    
    enum Section: String, CaseIterable {
        case capital = "Capital"
        case small = "Small"
    }

    var dataSource: UITableViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UITableViewDiffableDataSource(tableView: self.tableView, cellProvider: { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
            cell.textLabel?.text = item
            return cell
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 섹션 타입, 아이템 타입
        var snapShotForCapital = NSDiffableDataSourceSnapshot<Section, String>()
        // 처음 섹션 추가
        snapShotForCapital.appendSections([.capital])
        snapShotForCapital.appendItems(["A", "B", "C"], toSection: .capital)
        dataSource.apply(snapShotForCapital)
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            var snapShotForSmall = self.dataSource.snapshot()
            // 처음 섹션 추가
            snapShotForSmall.appendSections([.small])
            snapShotForSmall.appendItems(["a", "b", "c", "d", "e", "f"], toSection: .small)
            self.dataSource.apply(snapShotForSmall)
        }
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
            var snapShotForCapital = self.dataSource.snapshot()
            // 이미 섹션이 추가돼 있으므로, 추가할 필요 없음.
            snapShotForCapital.appendItems(["D", "E", "F"], toSection: .capital)
            self.dataSource.apply(snapShotForCapital)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = UILabel()
        let title = dataSource.sectionIdentifier(for: section)?.rawValue
        sectionTitle.text = title
        return sectionTitle
    }
}


#Preview(traits: .defaultLayout, body: {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(withIdentifier: "MultiSectionScene")
    return vc
})
