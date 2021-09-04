//
//  AppConfiguration.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

struct AppConfiguration {
    static var shared: AppConfiguration {

        struct Static {
            static let instance = AppConfiguration()
        }

        return Static.instance
    }

    let apiKey: String
    let privateApiKey: String
    let baseHost: String

    private init() {
        self.baseHost = AppConfiguration.fromBundle("Host")
        self.apiKey = AppConfiguration.fromBundle("ApiKey")
        self.privateApiKey = AppConfiguration.fromBundle("PrivateApiKey")
    }

    private static func fromBundle(_ key: String) -> String {
        return Bundle.main.infoDictionary![key] as? String ?? ""
    }
}
