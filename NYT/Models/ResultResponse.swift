//
//  ResultResponse.swift
//  NYT
//
//  Created by Abdulrahman on 3/26/22.
//


import Foundation

// MARK: - Results
struct ResultResponse: Decodable {

    let numResults: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Decodable {
    let title, abstract, byline, published_date: String?
    let media: [Media]?
}
