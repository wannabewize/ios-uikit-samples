//
// Realm DB를 이용한 할일 관리
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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


    override func viewDidLoad() {
        super.viewDidLoad()
        // addTodo(title: "Todo2", dueDate: Date())
        TodoManager.shared.resolveAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

