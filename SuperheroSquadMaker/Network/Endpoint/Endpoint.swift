//
//  Endpoint.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 04/09/2021.
//

import Foundation

protocol Endpoint {
    var path: String { get set }
    var params: [URLQueryItem] { get set }
}
