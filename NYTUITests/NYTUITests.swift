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


    //MARK: NavBar Tests

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

    //MARK: Table Tests

    func testShouldShowActivityIndicatorWhenTableHasNotData() throws {


        let table = app.tables.firstMatch
        if table.cells.count == 0 {
            let activityIndicator = app.tables["In progress"].activityIndicators["In progress"]


            XCTAssertTrue(activityIndicator.exists)
        }



    }

    func testShouldRemoveActivityIndicatorWhenTableHasData() throws {
        let table = app.tables.firstMatch
        let activityIndicator = app.tables["In progress"].activityIndicators["In progress"]

        let areTableCellsExist = table.cells.element.waitForExistence(timeout: 7)

        XCTAssertTrue(areTableCellsExist)
        XCTAssertFalse(activityIndicator.exists)

    }

    func testTableViewCellShouldBeClickable() throws {
        let tableCell = app.tables.firstMatch.cells.firstMatch

        XCTAssertTrue(tableCell.isHittable)


    }

    //MARK: Details View Tests

    func testDetailsViewShouldHaveAbstractLabel() throws {

        let abstract = app.children(matching: .staticText).matching(identifier: "abstract")

        XCTAssertNotNil(abstract)



    }





}
