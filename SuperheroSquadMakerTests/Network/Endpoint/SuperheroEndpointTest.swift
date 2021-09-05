//
//  SuperheroEndpointTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class SuperheroEndpointTest: XCTestCase {

    private var sut: SuperheroEndpoint!

    override func setUp() {
        super.setUp()
        sut = SuperheroEndpoint(heroId: 10)
    }

    func testPathWillBeFilled() throws {
        XCTAssertEqual(sut.path, "/v1/public/characters/10")
    }

    func testQueryParamsAreEmpty() throws {
        XCTAssertTrue(sut.params.isEmpty)
    }
}
