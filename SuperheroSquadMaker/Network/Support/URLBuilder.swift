//
//  URLBuilder.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 04/09/2021.
//

import Foundation
import CryptoKit

protocol URLBuilding {
    func build(to path: String, with params: [URLQueryItem]) -> URL
}

struct URLBuilder: URLBuilding {
    
    private let host = "http://gateway.marvel.com"
    private let apiKey = "4bf4b944263df6bc3f7fef38f24b52a1"
    private let privateApiKey = "f15a959cec0a071fe47fb882035befc64988bd45"
    
    func build(to path: String, with params: [URLQueryItem] = []) -> URL {
        var components = URLComponents(string: host + path)
        components?.queryItems = baseRequestQueryItens()
        components?.queryItems?.append(contentsOf: params)
        return (components?.url)!
    }
    
    private func baseRequestQueryItens() -> [URLQueryItem] {
        return [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "hash", value: hash()),
            URLQueryItem(name: "ts", value: timestamp())
        ]
    }
    
    private func hash() -> String {
        return Insecure.MD5
            .hash(data: (apiKey+privateApiKey).data(using: .utf8) ?? Data())
            .map {String(format: "%02x", $0)}
            .joined()
    }
    
    private func timestamp() -> String {
        return String(Date().timeIntervalSince1970)
    }
}
