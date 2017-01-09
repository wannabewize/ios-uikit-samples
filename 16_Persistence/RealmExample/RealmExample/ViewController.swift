//
//  RealmExample
//

import UIKit
import RealmSwift


class Todo : Object {
    dynamic var title : String!
    dynamic var dueDate : Date!
}


class ViewController: UIViewController {
    
    func resolveAll() {
        let realm = try! Realm()
        let todos = realm.objects(Todo.self).sorted(byProperty: "dueDate", ascending: true)
        
        print("Count : ", todos.count)
        
        for todo in todos {
            print(todo.title, todo.dueDate)
        }
    }
    
    func add(title : String, due date : Date) {
        let todo = Todo()
        todo.title = title
        todo.dueDate = date
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(todo)
                print("Add success")
            }
        }
        catch let error {
            print("Error : ", error)
        }
    }
    
    // 할일 이름 바꾸기
    func changeTodo(from: String, to: String) {
        let todos = findTodo(title: from)
        
        guard todos.count > 0 else {
            print("바꾸려고 하는 할일이 없음")
            return
        }
        
        let realm = try! Realm()
        
        do {
            try realm.write {
                for todo in todos {
                    todo.title = to
                }
            }
        }
        catch let error {
            print("chaangeTodo Error :", error)
        }
    }
    
    // 삭제
    func deleteTodo(title : String) {
        // 삭제하려는 할일 검색
        let todo = findTodo(title: title)
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(todo)
        }
    }
    
    // 찾기
    func findTodo(title : String) -> [Todo] {
        let realm = try! Realm()
        let results : Results<Todo> = realm.objects(Todo.self).filter("title = %@", title)
        return Array<Todo>(results)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(NSHomeDirectory())
        
//        add(title: "Todo1", due: Date())
//        add(title: "Todo2", due: Date())
//        add(title: "Todo3", due: Date())
        
//        changeTodo(from: "Todo3", to: "할일3")
        
//        deleteTodo(title: "Todo2")
        
        resolveAll()

    }


}

