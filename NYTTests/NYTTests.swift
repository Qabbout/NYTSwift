//
//  NYTTests.swift
//  NYTTests
//
//  Created by Abdulrahman on 3/25/22.
//

import XCTest
@testable import NYT

class NYTTests: XCTestCase {

    let moockAPI = MockNYTService.shared
    var results: ResultResponse?
    var swiftResult: Swift.Result<ResultResponse, Error>?



    override func tearDownWithError() throws {
        results = nil
        swiftResult = nil

    }

    //MARK: Test Json Decoding

    func testLoadJsonShouldReturnNotNilResultsModel() {

        //Arrange:

        //Act:
        results = moockAPI.loadJsonAsResultsModel()

        //Assert:

        XCTAssertNotNil(results)

    }

    func testLoadJsonShouldReturnValidResultsModel() {

        //Arrange:

        //Act:
        results = moockAPI.loadJsonAsResultsModel()

        //Assert:

        XCTAssertGreaterThan(results!.numResults, 0)
        XCTAssertEqual(results?.results[0].title, "Trump Is Guilty of ‘Numerous’ Felonies, Prosecutor Who Resigned Says")
        XCTAssertEqual(results?.results[0].byline, "By William K. Rashbaum, Ben Protess and Jonah E. Bromwich")
        XCTAssertEqual(results?.results[0].abstract, "Mark F. Pomerantz, who had investigated the former president, left after the Manhattan district attorney, Alvin Bragg, halted an effort to seek an indictment.")
        XCTAssertEqual(results?.results[0].publishedDate, "2022-03-23")

    }

    //MARK: Test Get Articles Success

    func testGetArticlesShouldReturnSwiftResultNotNil() throws {

        //Arrange:
        moockAPI.shouldReturnError = false



        //Act:
        moockAPI.getArticles { [weak self] result in
            self?.swiftResult = result

        }

        results = try swiftResult?.get()

        //Assert:
        XCTAssertNotNil(swiftResult)
        XCTAssertNotNil(results)
    }

    func testGetArticlesResultsShouldNotThrow() throws {
        //Arrange:
        moockAPI.shouldReturnError = false



        //Act:
        moockAPI.getArticles { [weak self] result in
            self?.swiftResult = result

        }

        //Assert:
        XCTAssertNoThrow(try swiftResult?.get())
    }

    func testGetArticlesShouldReturnArticlesNotNil() throws {
        //Arrange:
        moockAPI.shouldReturnError = false



        //Act:
        moockAPI.getArticles { [weak self] result in
            self?.swiftResult = result

        }

        results = try swiftResult?.get()

        //Assert:

        XCTAssertNotNil(results?.numResults)
        XCTAssertNotNil(results?.results[0].title)
        XCTAssertNotNil(results?.results[0].byline)
        XCTAssertNotNil(results?.results[0].publishedDate)
        XCTAssertNotNil(results?.results[0].abstract)
    }

    func testGetArticlesShouldReturnArticles() throws {
        //Arrange:
        moockAPI.shouldReturnError = false

        //Act:
        moockAPI.getArticles { [weak self] result in
            self?.swiftResult = result

        }

        results = try swiftResult?.get()

        //Assert:

        XCTAssertGreaterThan(results!.numResults, 0)
        XCTAssertEqual(results?.results[0].title, "Trump Is Guilty of ‘Numerous’ Felonies, Prosecutor Who Resigned Says")
        XCTAssertEqual(results?.results[0].byline, "By William K. Rashbaum, Ben Protess and Jonah E. Bromwich")
        XCTAssertEqual(results?.results[0].abstract, "Mark F. Pomerantz, who had investigated the former president, left after the Manhattan district attorney, Alvin Bragg, halted an effort to seek an indictment.")
        XCTAssertEqual(results?.results[0].publishedDate, "2022-03-23")
    }

    //MARK: Test Get Articles Failure

    func testGetArticlesShouldThrowGetArticlesError() throws {
        //Arrange:
        moockAPI.shouldReturnError = true
        var resultsError: Error?

        //Act:
        moockAPI.getArticles { [weak self] result in
            self?.swiftResult = result

        }
        do {
            results = try swiftResult?.get()

        } catch {
            resultsError = error
        }

        //Assert:
        XCTAssertThrowsError(try swiftResult?.get())
        XCTAssertNil(results)
        XCTAssertNotNil(resultsError)

    }


}
