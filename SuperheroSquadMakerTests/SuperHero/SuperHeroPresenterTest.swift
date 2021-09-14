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
    private var heroesRepository: HeroRepositoryMock!

    override func setUp() {
        super.setUp()
        view = SuperHeroViewControllerMock()
        heroesService = HeroesServiceMock()
        heroesRepository = HeroRepositoryMock()
        sut = SuperHeroPresenter(delegate: view, service: heroesService, repository: heroesRepository)
    }

    func testLoadRecentCallLoadListWhenTheResponseIsOK() throws {
        sut.getAllHeroes()
        XCTAssertTrue(view.didCallLoadHeroes)
    }

    func testLoadRecentCallEmptyResponseWhenTheDatasetComesEmpty() throws {
        heroesService.forceEmpty = true
        heroesRepository.forceEmpty = true
        sut.getAllHeroes()
        XCTAssertTrue(view.didCallShowEmptyDatasetMessage)
    }

    func testLoadRecentCallErrorResponseWhenTheDatasetComesEmpty() throws {
        heroesService.forceError = true
        heroesRepository.forceEmpty = true
        sut.getAllHeroes()
        XCTAssertTrue(view.didCallShowErrorAtLoadingHeroes)
    }
}
