//
//  TestingTests.swift
//  TestingTests
//
//  Created by Jaehoon Lee on 2017. 2. 26..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import XCTest
@testable import Testing

class TestingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func justDoIt() -> Bool{
        return true
    }
    
    func add(_ i: Int, _ j : Int) -> Int {
        return i + j
    }
    
    func increaseOne(_ i : Int) -> Int {
        return i+1
    }
    
    func testExample() {
        XCTAssertTrue(justDoIt(), "Should return true")
        XCTAssertEqual(add(1, 2), 3, "1 + 2 should be 3")
        XCTAssertGreaterThan(increaseOne(10), 10, "10 + 1 > 10")
    }
    
    func heavyWork() {
        Thread.sleep(forTimeInterval: 0.1)
    }
    
    func testPerformanceExample() {
        self.measure {
            self.heavyWork()
        }
    }
    
}
