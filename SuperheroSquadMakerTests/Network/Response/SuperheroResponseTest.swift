//
//  SuperheroResponseTest.swift
//  SuperheroSquadMakerTests
//
//  Created by CTW00710-Admin on 04/09/2021.
//

import Foundation

import XCTest

@testable import SuperheroSquadMaker

class SuperheroResponseTest: XCTestCase {

    var sut: SuperheroResponse!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "superhero", type: SuperheroResponse.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.id, 1017100)
        XCTAssertEqual(sut.name, "A-Bomb (HAS)")
        XCTAssertTrue(sut.description.contains("Rick Jones has been Hulk's best bud since day one"))
        XCTAssertNotNil(sut.thumbnail)
    }
}
