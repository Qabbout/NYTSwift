//
//  Results.swift
//  NYT
//
//  Created by Abdulrahman on 3/26/22.
//


import Foundation

// MARK: - Results
struct Results: Codable {

    let numResults: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let title, abstract, byline, publishedDate: String

    enum CodingKeys: String, CodingKey {

        case publishedDate = "published_date"
        case byline, title, abstract

    }
}
