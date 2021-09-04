//
//  UrlBuilderTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 04/09/2021.
//

import XCTest
import CryptoKit

@testable import SuperheroSquadMaker

class UrlBuilderTest: XCTestCase {

    var sut: URLBuilder!

    override func setUp() {
        super.setUp()
        sut = URLBuilder()
    }

    func testWhenThereAreNoParamsShouldReturnTheStandardURL() throws {
        let url = sut.build()
        XCTAssertEqual(url.host, "test.gateway.marvel.com")
        XCTAssertTrue(url.query!.contains("apikey"))
        XCTAssertTrue(url.query!.contains("hash"))
        XCTAssertTrue(url.query!.contains("ts"))
    }

    func testApiKeyIsFilled() throws {
        let url = sut.build()
        XCTAssertTrue(url.query!.contains("apikey=123public"))
    }

    func testVerifyURLParamsBuilder() throws {
        let dummyItem = URLQueryItem(name: "dummy", value: "thisIsADummyParam")
        let url = sut.build(with: [dummyItem])
        XCTAssertTrue(url.query!.contains("dummy=thisIsADummyParam"))
    }
}
