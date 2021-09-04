//
//  ThumbnailResponse.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

struct ThumbnailResponse: Codable {
    let path: String?
    let ext: String?

    enum CodingKeys: String, CodingKey {
        case path = "path"
        case ext = "extension"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        ext = try values.decodeIfPresent(String.self, forKey: .ext)
    }
}
