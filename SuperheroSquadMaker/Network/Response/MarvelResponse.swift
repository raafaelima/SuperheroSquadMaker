//
//  MarvelResponse.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

struct MarvelResponse<T: Codable>: Codable {

    let code: Int?
    let status: String?
    let data: MarvelData<T>?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        data = try values.decodeIfPresent(MarvelData<T>.self, forKey: .data)
    }
}
