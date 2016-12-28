//
// 테이블뷰를 이용한 편집
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = ["1","2","3","4","5"]
    
    @IBAction func editList(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        // 난수로 셀 편집 스타일 설정
        let r = Int(arc4random_uniform(3))
        return UITableViewCellEditingStyle(rawValue: r)!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // 선택한 데이터와 셀 삭제
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        else {
            // 새로운 데이터 추가
            let dialog = UIAlertController(title: "추가하기", message: "새로운 데이터 입력", preferredStyle: UIAlertControllerStyle.alert)
            
            // TODO : 완성하기
            self.show(dialog, sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

