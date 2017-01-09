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

    static let shared = TodoManager()
    
    // Singleton 이외의 방법으로 객체 생성 방지
    private init() {
    }
    
    var todoList = [Todo]()
    
    var count : Int {
        return todoList.count
    }
    
    func resolveAll() {
        let request : NSFetchRequest<Todo> = Todo.fetchRequest()
        
        // 일주일 이내 완료. NSDate 타입 사용
        let date = Date(timeIntervalSinceNow: 60 * 60 * 24 * 7) as NSDate
        let predicate = NSPredicate(format: "dueDate <= %@", date) // Date 타입 호환 안됨
        request.predicate = predicate

        let sort = NSSortDescriptor(key: "dueDate", ascending: true)
        request.sortDescriptors = [sort]

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        let moc = container.viewContext
        
        do {
            let todos = try moc.fetch(request)
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
        guard index < todoList.count else {
            return nil
        }
        return todoList[index]
    }
    
    // 새 할일 추가
    func add(title : String, due date : Date) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let container = appDelegate.persistentContainer
        let moc : NSManagedObjectContext = container.viewContext
        
        let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: moc) as! Todo
        todo.title = title
        // Date -> NSDate로
        todo.dueDate = date as NSDate
        
        
        do {
            try moc.save()
            print("Save Success!")
        }
        catch let error {
            print("Error ", error.localizedDescription)
        }
        
        
        // 모델 변경을 컨트롤러에게 알림
        NotificationCenter.default.post(name: TodoManager.AddNotification, object: nil, userInfo:["INDEX":index])
    }
}
