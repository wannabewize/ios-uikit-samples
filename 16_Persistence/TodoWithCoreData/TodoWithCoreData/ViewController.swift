//
//  TodoWithCoreData
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("todo count : ", TodoManager.shared.count)
        return TodoManager.shared.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TODO_CELL", for: indexPath)
        let todo = TodoManager.shared.todo(at: indexPath.row)!
        cell.textLabel?.text = todo.title!
        cell.detailTextLabel?.text = todo.dueDate?.description
        return cell
    }
    
    // 할일 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        TodoManager.shared.remove(at: indexPath.row)
    }
    
    
    // 모델 추가 알림 다루기
    func handleTodoAddNoti(noti : Notification) {
        tableView.reloadData()
    }
    
    // 모델 삭제 알림 다루기
    func handleTodoDeleteNoti(noti : Notification) {
        tableView.reloadData()
    }
    
    // 모델 변경 감지를 위한 감시객체 등록
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(handleTodoAddNoti), name: TodoManager.AddNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTodoDeleteNoti), name: TodoManager.DeleteNotification, object: nil)
    }
    
    // 모델 변경 감시 객체 해제
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Home Directory : ",NSHomeDirectory())
        
        TodoManager.shared.resolveAll()
    }   
}

