//
//  NYTService.swift
//  NYT
//
//  Created by Abdulrahman on 3/26/22.
//

import Foundation
import RxSwift


protocol NYTServiceProtocol {

    func getArticles(completion: @escaping (Swift.Result<ResultResponse, Error>) -> Void)
}

struct NYTService {

    //MARK: Variables


    static let API_KEY = (Bundle.main.infoDictionary?["API_KEY"] as? String)!

    static let section = "all-sections"
    static let period = "7"
    static let baseUrlString = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/\(section)/\(period).json?api-key=\(API_KEY)"



    private init() { }
    static var shared = NYTService()


    //MARK: Business Logic

    func populateNews() -> Observable<ResultResponse> {
        let resource = Resource<ResultResponse>(url: URL(string: NYTService.baseUrlString)!)

        return URLRequest.load(resource: resource)
    }
}
