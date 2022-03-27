//
//  MockNYTService.swift
//  NYTTests
//
//  Created by Abdulrahman on 3/27/22.
//

import Foundation
@testable import NYT


class MockNYTService {

 
    private var jsonData = Bundle(for: NYTTests.self).url(forResource: "articles", withExtension: "json")

    private init() { }
    static var shared = MockNYTService()

    var shouldReturnError = false
    var getArticlesCalled = false

    private func reset() {
        shouldReturnError = false
        getArticlesCalled = false


    }

    func loadJsonAsResultsModel() -> Results? {
        let decoder = JSONDecoder()

        do {
            let data = try Data(contentsOf: jsonData!)
            let decodedData = try decoder.decode(Results.self, from: data)
            let results = decodedData
            return results

        } catch {

            print(error.localizedDescription)
            return nil
        }
    }
    enum error: Error {
        case getArticlesError
    }


}

extension MockNYTService: NYTServiceProtocol {
    func getArticles(completion: @escaping (Swift.Result<Results, Error>) -> Void) {

        getArticlesCalled = true

        if shouldReturnError {
            completion(.failure(MockNYTService.error.getArticlesError))
        }
        else {
            if let results = loadJsonAsResultsModel() {
                completion(.success(results))
            }

        }

        reset()
    }
}


