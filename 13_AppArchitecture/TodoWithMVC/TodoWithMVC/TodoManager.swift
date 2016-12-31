//
//  TodoManager.swift
//  TodoWithMVC
//
//  Created by wannabewize on 2016. 9. 26..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import Foundation


let AddCompletionNotification = Notification.Name("TodoAddCompleted")
let DeleteCompletionNotification = Notification.Name("TodoDeleteCompleted")

class TodoManager {
    
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
    
    var todoList = [String]()
    
    var count : Int {
        return todoList.count
    }
    
    // 할일 삭제
    func remove(at index : Int) {
        // todoList.removeAtIndex(index) Swift 2.2
        todoList.remove(at: index)
        
        // 모델 변경을 컨트롤러에게 알림
        NotificationCenter.default.post(name: DeleteCompletionNotification, object: nil, userInfo:["INDEX":index])
    }
    
    func todo(at index : Int) -> String? {
        if index < todoList.count {
            return todoList[index]
        }
        return nil
    }
    
    // 새 할일 추가
    func add(todo : String) {
        todoList.append(todo)
        let index = todoList.count - 1
        
        // 모델 변경을 컨트롤러에게 알림
        NotificationCenter.default.post(name: AddCompletionNotification, object: nil, userInfo:["INDEX":index])
    }
}
