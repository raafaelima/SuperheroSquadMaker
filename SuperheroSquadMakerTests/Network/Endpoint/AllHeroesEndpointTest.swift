//
//  AllHeroesEndpointTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class AllHeroesEndpointTest: XCTestCase {

    private var sut: AllHeroesEndpoint!

    override func setUp() {
        super.setUp()
        sut = AllHeroesEndpoint()
    }

    func testPathWillBeFilled() throws {
        XCTAssertEqual(sut.path, "/v1/public/characters")
    }

    func testQueryParamsAreEmpty() throws {
        XCTAssertTrue(sut.params.isEmpty)
    }
}
