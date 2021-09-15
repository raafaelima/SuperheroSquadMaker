//
//  RealmFactoryTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 15/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class RealmFactoryTest: XCTestCase {

    func testRealShouldLoadTheCorrectSchemaVersion() throws {
        let database = RealmFactory.database()
        XCTAssertEqual(database.configuration.schemaVersion, 1)
    }
}
