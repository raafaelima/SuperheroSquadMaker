//
//  MarvelResponseTest.swift
//  SuperheroSquadMakerTests
//
//  Created by CTW00710-Admin on 05/09/2021.
//

import Foundation

import XCTest

@testable import SuperheroSquadMaker

class MarvelResponseTest: XCTestCase {

    var sut: MarvelResponse<SuperheroResponse>!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "heroesList", type: MarvelResponse<SuperheroResponse>.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.code, 200)
        XCTAssertEqual(sut.status, "Ok")
        XCTAssertNotNil(sut.data)
    }
}
