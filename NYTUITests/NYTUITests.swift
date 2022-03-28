//
//  NYTUITests.swift
//  NYTUITests
//
//  Created by Abdulrahman on 3/25/22.
//

import XCTest

class NYTUITests: XCTestCase {
    let app = XCUIApplication()


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    func testShouldHaveNavBarWithTitle() throws {
        let navBar = app.navigationBars["NY Times Most Popular"]


        XCTAssertNotNil(navBar)

    }

    func testShouldHaveNavBarWithRightBarButtonSearch() throws {

        let searchBarButton = XCUIApplication().navigationBars["NY Times Most Popular"].buttons["Search"]

        XCTAssertNotNil(searchBarButton)


    }

    func testShouldHaveNavBarWithRightBarButtonMore() throws {

        let moreBarButton = XCUIApplication().navigationBars["NY Times Most Popular"].buttons["more"]

        XCTAssertNotNil(moreBarButton)



    }

    func testShouldHaveNavBarWithRightBarButtonDrag() throws {

        let dragBarButton = XCUIApplication().navigationBars["NY Times Most Popular"].buttons["drag"]


        XCTAssertNotNil(dragBarButton)


    }
}
