import Foundation
import RealmSwift


// 모델 정의
class Todo : Object {
    dynamic var title : String!
    dynamic var dueDate : Date!
}


class TodoManager {
    static let AddNotification = Notification.Name("TodoAddNotification")
    static let DeleteNotification = Notification.Name("TodoDeleteNotification")
    
    static let shared = TodoManager()

    var todoList = [Todo]()
    
    var count : Int {
        return todoList.count
    }
    
    func addTodo(title : String, dueDate : Date) {
        let todo = Todo()
        todo.title = title
        todo.dueDate = dueDate
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(todo)
        }
    }
    
    
    func resolveAll() {
        let realm = try! Realm()
        let todos = realm.objects(Todo.self)
        for todo in todos {
            print(todo)
        }
    }
    
    // 할일 삭제
    func remove(at index : Int) {
        todoList.remove(at: index)
        
        // 모델 변경을 컨트롤러에게 알림
        NotificationCenter.default.post(name: TodoManager.DeleteNotification, object: nil, userInfo:["INDEX":index])
    }
    
    func todo(at index : Int) -> Todo? {

        return nil
    }
}
