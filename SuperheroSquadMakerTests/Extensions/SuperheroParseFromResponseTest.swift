//
//  SuperheroParseFromResponseTest.swift
//  SuperheroSquadMakerTests
//
//  Created by CTW00710-Admin on 04/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class SuperheroParseFromResponseTest: XCTestCase {

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

    func testThumbnailURLCreationIsCorrect() throws {
        XCTAssertEqual(sut.parse().thumbnailURL, "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16/portrait_incredible.jpg")
    }

    func testThumbnailShouldReturnEmptyURLWhenNotPresentOnResponse() throws {
        sut = JSONHelper.getObjectFrom(json: "superheroWithoutThumbnail", type: SuperheroResponse.self)!
        XCTAssertEqual(sut.parse().thumbnailURL, "")
    }
}
