//
//  MaryToastin_ExampleUITests.swift
//  MaryToastin_ExampleUITests
//
//  Created by jerome morissard on 07/11/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

class MaryToastin_ExampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        
        //present first Toast
        app.buttons["Present Toast"].tap()
        sleep(1)
        XCTAssert(app.staticTexts["Hello"].exists)
        sleep(2) //wait 2s auto dismiss
        
        app.buttons["Present sucess Toast"].tap()
        sleep(3)
        
        app.buttons["Present sucess Toast"].tap()
        sleep(1)
        app.images["actions-menu-close-blue.png"].tap()
        sleep(1)
    }
}
