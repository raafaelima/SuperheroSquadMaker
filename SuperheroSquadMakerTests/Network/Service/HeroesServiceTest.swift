//
//  HeroesServiceTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class HeroesServiceTest: XCTestCase {

    private var sut: HeroesService!
    private var networkProvider: URLSessionNetworkProviderMock!

    override func setUp() {
        super.setUp()
        self.networkProvider = URLSessionNetworkProviderMock()
        self.networkProvider.jsonFile = "heroesList"
        self.sut = HeroesService(networkProvider: networkProvider)
    }

    func testServiceCallRequestData() throws {
        sut.getAllSuperheroes { _ in }
        XCTAssertTrue(networkProvider.didCallRequestData)
        XCTAssertTrue(networkProvider.endpointRequestURL.contains("http://test.gateway.marvel.com/v1/public/characters?apikey=123"))
    }

    func testParseCorrectData() throws {
        sut.getAllSuperheroes { superheroes in
            XCTAssertEqual(superheroes?.count, 3)
            XCTAssertEqual(superheroes?.first!.id, 1011334)
        }
    }

    func testReturnEmptyListWhenResponseIsEmpty() throws {
        networkProvider.responseEmpty = true
        sut.getAllSuperheroes { superheroes in
            XCTAssertEqual(superheroes?.isEmpty, true)
        }
    }

    func testReturnEmptyListWhenErrorResponse() throws {
        networkProvider.forceError = true
        sut.getAllSuperheroes { superheroes in
            XCTAssertNil(superheroes)
        }
    }

}
