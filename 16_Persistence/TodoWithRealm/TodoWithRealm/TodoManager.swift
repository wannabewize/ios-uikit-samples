import Foundation
import RealmSwift


// 모델 정의
class Todo : Object {
    dynamic var title : String!
    dynamic var dueDate : Date!
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


func resolveAllTodos() {
    let realm = try! Realm()
    let todos = realm.objects(Todo.self)
    for todo in todos {
        print(todo)
    }
}
