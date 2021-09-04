//
//  Endpoint.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

protocol Endpoint {
    var path: String { get set }
    var params: [URLQueryItem] { get set }
}
