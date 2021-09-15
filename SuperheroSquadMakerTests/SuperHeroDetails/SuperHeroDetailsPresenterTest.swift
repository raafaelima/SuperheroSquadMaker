//
//  SuperHeroDetailsPresenterTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 15/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class SuperHeroDetailsPresenterTest: XCTestCase {

    private var sut: SuperHeroDetailsPresenter!
    private var heroesRepository: HeroRepositoryMock!

    override func setUp() {
        super.setUp()
        heroesRepository = HeroRepositoryMock()
        sut = SuperHeroDetailsPresenter(repository: heroesRepository)
    }

    func testUpdateHeroStatus() throws {
        let superhero = Superhero()
        sut.updateHiringStatus(hero: superhero)
        XCTAssertTrue(heroesRepository.didCallUpdate)
    }
}
