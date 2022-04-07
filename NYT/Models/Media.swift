//
//  Media.swift
//  NYT
//
//  Created by Abdulrahman on 4/7/22.
//

import Foundation

struct Media: Decodable {
    let mediaMetaData: [MediaMetaData]

    enum CodingKeys: String, CodingKey {
        case mediaMetaData = "media-metadata"
    }
}

struct MediaMetaData: Decodable {
    let url: String
    let format: String
    let height, width: Int
}
