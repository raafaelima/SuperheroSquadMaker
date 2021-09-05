//
//  LocalCacheManagerTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class LocalCacheManagerTest: XCTestCase {

    private var sut: CacheManager!

    override func setUp() {
        super.setUp()
        sut = LocalCacheManager()
    }

    func testSaveAndRetrieveInformationFromFile() throws {
        let myText = "Some text to write to file"
        let data = Data(myText.utf8)

        sut.save(onCache: data, at: "mock.json")

        let cache = String(decoding: sut.load(from: "mock.json"), as: UTF8.self)
        XCTAssertTrue(cache.contains("Some text"))
    }
}
