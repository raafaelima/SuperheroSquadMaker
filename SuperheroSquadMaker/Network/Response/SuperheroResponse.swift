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
    let description: String
    let modified: String
    let resourceURI: String
    let thumbnail: ThumbnailResponse?
    let comics: ComicsResponse?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case description = "description"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case resourceURI = "resourceURI"
        case comics = "comics"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        modified = try values.decode(String.self, forKey: .modified)
        thumbnail = try values.decodeIfPresent(ThumbnailResponse.self, forKey: .thumbnail)
        resourceURI = try values.decode(String.self, forKey: .resourceURI)
        comics = try values.decodeIfPresent(ComicsResponse.self, forKey: .comics)
    }
}
