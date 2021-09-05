//
//  SuperHeroPresenterTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class SuperHeroPresenterTest: XCTestCase {

    private var sut: SuperHeroPresenter!

    private var view: SuperHeroViewControllerMock!
    private var heroesService: HeroesServiceMock!

    override func setUp() {
        super.setUp()
        view = SuperHeroViewControllerMock()
        heroesService = HeroesServiceMock()
        sut = SuperHeroPresenter(delegate: view, service: heroesService)
    }

    func testLoadRecentCallLoadListWhenTheResponseIsOK() throws {
        sut.getAllHeroes()
        XCTAssertTrue(view.didCallLoadHeroes)
    }

    func testLoadRecentCallEmptyResponseWhenTheDatasetComesEmpty() throws {
        heroesService.forceEmpty = true
        sut.getAllHeroes()
        XCTAssertTrue(view.didCallShowEmptyDatasetMessage)
    }

    func testLoadRecentCallErrorResponseWhenTheDatasetComesEmpty() throws {
        heroesService.forceError = true
        sut.getAllHeroes()
        XCTAssertTrue(view.didCallShowErrorAtLoadingHeroes)
    }
}
