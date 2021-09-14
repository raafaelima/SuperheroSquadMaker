//
//  SuperHeroDetailsViewControllerTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import Foundation

import XCTest

@testable import SuperheroSquadMaker

class SuperHeroDetailsViewControllerTest: XCTestCase {

    var sut: SuperHeroDetailsViewController!

    override func setUp() {
        super.setUp()

        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "SuperHeroDetailsViewController") as? SuperHeroDetailsViewController

        let navigationController = UINavigationController()
        navigationController.viewControllers.append(mainViewController!)
        sut = mainViewController

        let response = JSONHelper.getObjectFrom(json: "superhero", type: SuperheroResponse.self)!
        let model = response.parse()
        sut.superhero = model

        _ = sut.view
    }

    func testViewDidLoadSetCorrectTitle() throws {
        sut.viewDidLoad()
        XCTAssertEqual(sut.title, "A-Bomb (HAS)")
    }

    func testViewDidLoadTheHeroName() throws {
        sut.viewDidLoad()
        XCTAssertEqual(sut.heroName.text, "A-Bomb (HAS)")
    }

    func testViewDidLoadTheHeroDescription() throws {
        sut.viewDidLoad()
        XCTAssertTrue(sut.heroDescription.text.contains("Rick Jones has been Hulk's best bud since day one, but now he's more than a friend..."))
    }
}
