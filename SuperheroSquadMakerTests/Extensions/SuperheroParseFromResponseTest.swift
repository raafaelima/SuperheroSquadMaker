//
//  SuperheroParseFromResponseTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 04/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class SuperheroParseFromResponseTest: XCTestCase {

    var sut: SuperheroResponse!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "superhero", type: SuperheroResponse.self)!
    }

    func testThumbnailURLCreationIsCorrect() throws {
        XCTAssertEqual(sut.parse().thumbnailURL, "https://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16/portrait_incredible.jpg")
    }

    func testThumbnailShouldReturnEmptyURLWhenNotPresentOnResponse() throws {
        sut = JSONHelper.getObjectFrom(json: "superheroWithoutThumbnail", type: SuperheroResponse.self)!
        XCTAssertEqual(sut.parse().thumbnailURL, "")
    }

    func testParseResponseToModel() throws {
        let model = sut.parse()
        XCTAssertEqual(model.id, sut.id)
        XCTAssertEqual(model.name, sut.name)
        XCTAssertEqual(model.description, sut.description)
        XCTAssertEqual(model.modified, sut.modified)
    }

}
