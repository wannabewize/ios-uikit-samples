//
//  TodoManager.swift
//  TodoWithMVC
//
//  Created by wannabewize on 2016. 9.
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit
import CoreData


class TodoManager {
    
    static let AddNotification = Notification.Name("TodoAddNotification")
    static let DeleteNotification = Notification.Name("TodoDeleteNotification")
    
    static private var instance : TodoManager!
    static var shared : TodoManager {
        if nil == instance {
            instance = TodoManager()
        }
        return instance
    }
    
    // Singleton 이외의 방법으로 객체 생성 방지
    private init() {
    }
    
    var todoList = [Todo]()
    
    var count : Int {
        return todoList.count
    }
    
    func resolveAll() {
        let request : NSFetchRequest<Todo> = Todo.fetchRequest()
        
        let date = Date(timeIntervalSinceNow: 60 * 60 * 24 * 7)
        let predicate = NSPredicate(format: "dueDate <= %@", [date])
        request.predicate = predicate
        
        let sort = NSSortDescriptor(key: "duaDate", ascending: true)
        request.sortDescriptors = [sort]
        

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        do {
            let todos = try container.viewContext.fetch(request)
            print(todos)
            self.todoList = todos
        }
        catch let error {
            print("Fetching error :", error.localizedDescription)
        }
    }
    
    // 할일 삭제
    func remove(at index : Int) {
        todoList.remove(at: index)
        
        // 모델 변경을 컨트롤러에게 알림
        NotificationCenter.default.post(name: TodoManager.DeleteNotification, object: nil, userInfo:["INDEX":index])
    }
    
    func todo(at index : Int) -> Todo? {
        if index < todoList.count {
            return todoList[index]
        }
        return nil
    }
    
    // 새 할일 추가
    func add(title : String, due date : Date) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        
        let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: container.viewContext) as! Todo
        todo.title = title
        todo.dueDate = date as NSDate
        
        
        do {
            try container.viewContext.save()
            print("Save Success!")
        }
        catch let error {
            print("Error ", error.localizedDescription)
        }
        
        
        // 모델 변경을 컨트롤러에게 알림
        NotificationCenter.default.post(name: TodoManager.AddNotification, object: nil, userInfo:["INDEX":index])
    }
}
