//
//  AppConfigurationTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 04/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class AppConfigurationTest: XCTestCase {

    func testHostIsFilled() throws {
        let host = AppConfiguration.sharedInstance.baseHost
        XCTAssertEqual(host, "http://test.gateway.marvel.com")
    }

    func testApiKeyIsFilled() throws {
        let host = AppConfiguration.sharedInstance.apiKey
        XCTAssertEqual(host, "123public")
    }

    func testPrivateApiKeyIsFilled() throws {
        let host = AppConfiguration.sharedInstance.privateApiKey
        XCTAssertEqual(host, "123private")
    }
}
