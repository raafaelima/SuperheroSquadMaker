//
//  SuperheroResponse.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

struct SuperheroResponse: Codable {

    let id: Int
    let name: String
    let biography: String
    let modified: String
    let thumbnail: ThumbnailResponse?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case biography = "description"
        case modified = "modified"
        case thumbnail = "thumbnail"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        biography = try values.decode(String.self, forKey: .biography)
        modified = try values.decode(String.self, forKey: .modified)
        thumbnail = try values.decodeIfPresent(ThumbnailResponse.self, forKey: .thumbnail)
    }
}
