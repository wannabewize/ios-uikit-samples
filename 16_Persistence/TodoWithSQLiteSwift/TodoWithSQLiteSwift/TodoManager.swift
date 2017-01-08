//
//  TodoManager.swift
//

import Foundation
import SQLite

struct Todo {
    var todoId : Int
    var title : String
    var dueDate : Date?
}

class TodoManager {
    
    static let shared = TodoManager()
    var formatter : DateFormatter!
    var db : Connection!
    
    // 싱글톤 방식 외에는 객체 생성 못하도록 private로
    private init() {
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
    }
    
    
    // 할일 배열
    var todoList = [Todo]()
    
    // 할일 개수
    var count : Int {
        return todoList.count
    }
    
    // 할일 - 인덱스로 식별
    func todo(at index : Int) -> Todo {
        return todoList[index]
    }
    
    
    func addTodo(title : String, dueDate : Date) {
        
        do {
            let dateStr = formatter.string(from: dueDate)
            try db.run("INSERT INTO TODO (TITLE, DUEDATE) VALUES (?, ?)", title, dateStr)
        }
        catch let error {
            print("INSERT ERROR : ", error)
        }
        
        resolveAllTodo()
    }
    
    // 할일 삭제
    func removeTodo(id : Int) {
        
        do {
            try db.run("DELETE FROM todo WHERE rowid=?", id)
        }
        catch let error {
            print("DELETE ERROR : ", error)
        }
        
        resolveAllTodo()
    }
    
    // 모든 할일 객체 얻어오기
    func resolveAllTodo() {
        todoList.removeAll()
        
        if let statement = try? db.run("SELECT id, title, duedate FROM todo") {
            for (_, row) in statement.enumerated() {
                // print(index, row)
                let todoId = Int(row[0] as! Int64)
                let title = row[1] as! String
                let dateStr = row[2] as! String
                let dueDate = formatter.date(from: dateStr)
                
                // Todo 객체
                let todo = Todo(todoId: todoId, title: title, dueDate: dueDate)
                todoList.append(todo)
            }
        }
    }
    
    func openDB() {
        // 데이터베이스 파일 경로
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = "\(docPath)/todo.sqlite"
        print(filePath)
        
        do {
            db = try Connection(filePath)
            // 테이블 생성
            try db.execute("CREATE TABLE IF NOT EXISTS todo ( id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, duedate DATE )")
        }
        catch let error {
            print("Error : ", error)
        }
    }
}
