//
//  MarvelDataTest.swift
//  SuperheroSquadMakerTests
//
//  Created by CTW00710-Admin on 05/09/2021.
//

import Foundation

import XCTest

@testable import SuperheroSquadMaker

class MarvelDataTest: XCTestCase {

    var sut: MarvelData<SuperheroResponse>!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "marvelData", type: MarvelData<SuperheroResponse>.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.offset, 0)
        XCTAssertEqual(sut.limit, 3)
        XCTAssertEqual(sut.total, 1559)
        XCTAssertEqual(sut.count, 3)
        XCTAssertNotNil(sut.results)
        XCTAssertEqual(sut.results?.count, 0)
    }
}
