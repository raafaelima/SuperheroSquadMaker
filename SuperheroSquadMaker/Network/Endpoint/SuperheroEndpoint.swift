//
//  SuperheroEndpoint.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 05/09/2021.
//

import Foundation

struct SuperheroEndpoint: Endpoint {
    var path: String = "/v1/public/characters"
    var params: [URLQueryItem] = []

    init(heroId: Int) {
        self.path += "/\(heroId)"
    }
}
