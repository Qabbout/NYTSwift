//
//  NYTService.swift
//  NYT
//
//  Created by Abdulrahman on 3/26/22.
//

import Foundation




struct NYTService {

    static let API_KEY = (Bundle.main.infoDictionary?["API_KEY"] as? String)!

    static let section = "all-sections"
    static let period = "7"
    static let baseUrlString = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/\(section)/\(period).json?api-key=\(API_KEY)"



    private init() { }
    static var shared = NYTService()


    func getArticles(completion: @escaping (Swift.Result<Results, Error>) -> Void) {
        performRequest(with: NYTService.baseUrlString) { result in
            completion(result)

        }

    }


    private func performRequest(with urlString: String, completion: @escaping (Swift.Result<Results, Error>) -> Void) {
        if let url = URL(string: urlString) {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { data, response, error in

                if let error = error {
                    completion(.failure(error))

                }

                if let data = data {
                    if let results = self.parseJson(data) {
                        completion(.success(results))


                    }

                }
            }
            task.resume()
        }

    }

    private func parseJson(_ data: Data) -> Results? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Results.self, from: data)
            let results = decodedData
            return results

        } catch {

            print(error.localizedDescription)
            return nil
        }
    }

}

