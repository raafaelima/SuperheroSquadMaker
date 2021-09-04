//
//  Endpoint+UrlRequest.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

extension Endpoint {
    func urlRequest() -> URLRequest {
        let builder: URLBuilding = URLBuilder()
        let endpointURL = builder.build(to: path, with: params)

        var request = URLRequest(url: endpointURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
