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
    
    var realm : Realm!
    var realmNotiToken : NotificationToken!
    private init() {
        realm = try! Realm()
        realmNotiToken = realm.addNotificationBlock { (noti : Realm.Notification, realm : Realm) in
            print("change! : \(noti)")
        }
    }

    var todoList = [Todo]()
    
    var count : Int {
        return todoList.count
    }
    
    // 할일 추가
    func addTodo(title : String, dueDate : Date) {
        let todo = Todo()
        todo.title = title
        todo.dueDate = dueDate

        do {
            try realm.write {
                realm.add(todo)
            }
            
            resolveAll()
            let index = self.todoList.count - 1
            NotificationCenter.default.post(name: TodoManager.AddNotification, object: nil, userInfo: ["INDEX":index])
        }
        catch let error {
            print("addTodo Error :", error)
        }
        
    }
    
    func resolveAll() {
        let todos = realm.objects(Todo.self).sorted(byKeyPath: "dueDate", ascending: true)
        let token = todos.addNotificationBlock { (change : RealmCollectionChange<Results<Todo>>) in
            print("todos list change : \(change)")
        }
        self.todoList = Array<Todo>(todos)
    }
    
    // 할일 삭제
    func remove(at index : Int) {
        let todo = todoList[index]
        todoList.remove(at: index)
        print("todoList remove")
        do {
            try realm.write {
                realm.delete(todo)
            }
        }
        catch let error {
            print("remove Todo Error : ", error)
        }
        
    }
    
    func todo(at index : Int) -> Todo? {
        return todoList[index]
    }
}
