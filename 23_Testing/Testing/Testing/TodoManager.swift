//
//  TodoManager.swift
//  Testing
//
//  Created by Jaehoon Lee on 2017. 2. 27..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import Foundation

struct Todo {
    var title : String
    var dueDate : Date?
}

class TodoManager {
    static let shared = TodoManager()
    
    private var todos = [Todo]()
    
    var count : Int {
        return todos.count
    }
    
    func addTodo(title : String, dueDate : Date?) {
        let todo = Todo(title: title, dueDate: dueDate)
        todos.append(todo)
    }
    
    func todos(until : Date) -> [Todo] {
        return todos.filter { (todo) -> Bool in
            if let date = todo.dueDate {                
                return date < until
            }
            return false
        }
    }
    
    func saveTodos() {
        Thread.sleep(forTimeInterval: 0.1)
    }
    
    func publishTodos(_ completion : @escaping () -> () ) {
        // 타이머를 이용해서 비동기 방식으로 동작하기
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
            completion()
        }
    }
}
