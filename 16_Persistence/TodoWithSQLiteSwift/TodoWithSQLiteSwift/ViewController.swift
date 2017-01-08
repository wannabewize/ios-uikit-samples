//
//  TodoWithSQLiteSwift
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    var formatter : DateFormatter!
    // 모델
    var manager : TodoManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        manager = TodoManager.shared
        manager.openDB()
        manager.resolveAllTodo()
    }
    
    // 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let todo = manager.todo(at: indexPath.row)
        manager.removeTodo(id: todo.todoId)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        // 할일 객체
        let todo = manager.todo(at: indexPath.row)
        cell.textLabel!.text = todo.title
        cell.detailTextLabel?.text = formatter.string(from: todo.dueDate!)
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }


}

