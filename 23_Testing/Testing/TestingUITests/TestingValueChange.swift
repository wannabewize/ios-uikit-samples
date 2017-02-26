//
//  TestingValueChange.swift
//  Testing
//
//  Created by Jaehoon Lee on 2017. 2. 27..
//  Copyright © 2017년 vanillastep. All rights reserved.
//
import XCTest

class TestingValueChange: XCTestCase {
    
    var app : XCUIApplication!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDecrease() {
        let labels = app.staticTexts
        
        XCTAssertEqual(labels.count, 2)
        
        // 글자가 5인 레이블
        let label = labels.element(boundBy: 1)
        
        let label5 = app.staticTexts["5"]
        XCTAssertEqual(label5.label, "5")
        
        let numLabel = app.staticTexts["numLabel"] // accessibility identifer
        XCTAssertEqual(numLabel.label, "5")
        
        // 초기 레이블의 값은 5
        print("id : \(label.identifier)==")
        XCTAssertEqual(label.label, "5")
        
        let downButton = app.buttons["Down"]
        downButton.tap()
        downButton.tap()
        downButton.tap()
        downButton.tap()
        downButton.tap()
        
        XCTAssertEqual(label.label, "0")
        
        XCTAssertFalse(downButton.isEnabled)
    }
}

























