//
//  ComicsResponse.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

struct ComicsResponse: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ItemsResponse]?
    let returned: Int?

    enum CodingKeys: String, CodingKey {
        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        available = try values.decodeIfPresent(Int.self, forKey: .available)
        collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
        items = try values.decodeIfPresent([ItemsResponse].self, forKey: .items)
        returned = try values.decodeIfPresent(Int.self, forKey: .returned)
    }
}
