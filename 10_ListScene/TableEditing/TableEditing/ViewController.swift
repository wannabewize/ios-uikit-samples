//
// 테이블뷰를 이용한 편집
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toolbar: UIToolbar!
    
    var data = ["item-1","item-2","item-3","item-4","item-5", "item-6", "item-7"]
    
    @IBAction func editList(_ sender: UIBarButtonItem) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        sender.title = tableView.isEditing ? "Done" : "Edit"
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        // 난수로 셀 편집 스타일 설정
        let r = Int(arc4random_uniform(3))
        return UITableViewCellEditingStyle(rawValue: r)!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
//            tableView.beginUpdates()
            // 선택한 데이터와 셀 삭제
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
//            tableView.endUpdates()
        }
        else {
            // 새로운 데이터 추가
            let dialog = UIAlertController(title: "추가하기", message: "새로운 데이터 입력", preferredStyle: UIAlertControllerStyle.alert)
            
            // TODO : 완성하기
            self.show(dialog, sender: nil)
        }
    }
    
    // 삭제 버튼 제목 커스터마이징
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "Del"
//    }
//    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 코드로 추가
        let editButton = UIBarButtonItem(title: "Edit(Code)", style: .plain, target: self, action: #selector(editList(_:)))
        self.toolbar.items?.append(editButton)
        
        self.toolbar.items?.append(self.editButtonItem)
    }
    @IBAction func selectionModeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.tableView.allowsSelectionDuringEditing = false
        }
        else if sender.selectedSegmentIndex == 1 {
            self.tableView.allowsSelectionDuringEditing = true
            self.tableView.allowsMultipleSelectionDuringEditing = false
        }
        else if sender.selectedSegmentIndex == 2 {
            self.tableView.allowsMultipleSelectionDuringEditing = true
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        print("setEditing : \(editing)")
        
        tableView.setEditing(editing, animated: true)
    }
}

