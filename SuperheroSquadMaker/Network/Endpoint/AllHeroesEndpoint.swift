//
//  AllHeroesEndpoint.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

struct AllHeroesEndpoint: Endpoint {
    var path: String = "/v1/public/characters"
    var params: [URLQueryItem] = []
}
