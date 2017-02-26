//
//  TestingTodoManager.swift
//  Testing
//
//  Created by Jaehoon Lee on 2017. 2. 27..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import XCTest
@testable import Testing

class TestingTodoManager: XCTestCase {
    
    var manager : TodoManager!
    
    override func setUp() {
        super.setUp()
        manager = TodoManager.shared
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func dateFrom(month: Int, day: Int) -> Date? {
        let components = DateComponents(year: 2017, month: month, day: day)
        return Calendar.current.date(from: components)
    }
    
    func testAddTodo() {
        manager.addTodo(title: "Todo1", dueDate: nil)
        manager.addTodo(title: "Todo2", dueDate: Date())
        
        XCTAssertEqual(manager.count, 2)
    }

    func testTodoUntil() {
        manager.addTodo(title: "Mayday", dueDate: dateFrom(month:5, day:1))
        manager.addTodo(title: "Christmas", dueDate: dateFrom(month: 12, day: 25))
        
        let date = dateFrom(month: 8, day: 1)!
        let todoUntilAug = manager.todos(until: date)
        
        XCTAssertEqual(todoUntilAug.count, 1)
    }
    
    func testPublish() {
        let expectation : XCTestExpectation = self.expectation(description: "Publish")
        manager.publishTodos {
            XCTAssertTrue(true)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
    
func testTodoSaving() {
    self.measure {
        self.manager.saveTodos()
    }
}

    
    
    
}


