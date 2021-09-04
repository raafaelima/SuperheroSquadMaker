//
//  URLBuilder.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation
import CryptoKit

protocol URLBuilding {
    func build(to path: String, with params: [URLQueryItem]) -> URL
}

struct URLBuilder: URLBuilding {

    private var timestamp = String(Date().timeIntervalSince1970)

    func build(to path: String = "", with params: [URLQueryItem] = []) -> URL {
        let host = AppConfiguration.shared.baseHost
        var components = URLComponents(string: host + path)
        components?.queryItems = baseRequestQueryItens()
        components?.queryItems?.append(contentsOf: params)
        return (components?.url)!
    }

    private func baseRequestQueryItens() -> [URLQueryItem] {
        return [
            URLQueryItem(name: "apikey", value: apiKey()),
            URLQueryItem(name: "hash", value: hash()),
            URLQueryItem(name: "ts", value: timestamp)
        ]
    }

    private func hash() -> String {
        return Insecure.MD5
            .hash(data: (timestamp+privateApiKey()+apiKey()).data(using: .utf8) ?? Data())
            .map {String(format: "%02x", $0)}
            .joined()
    }

    private func apiKey() -> String {
        return AppConfiguration.shared.apiKey
    }

    private func privateApiKey() -> String {
        return AppConfiguration.shared.privateApiKey
    }
}
