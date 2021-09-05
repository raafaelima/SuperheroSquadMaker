//
//  SuperHeroViewControllerTest.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import XCTest

@testable import SuperheroSquadMaker

class SuperHeroViewControllerTest: XCTestCase {

    var sut: SuperHeroViewController!

    override func setUp() {
        super.setUp()

        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "superheroesVC") as? SuperHeroViewController

        let navigationController = UINavigationController()
        navigationController.viewControllers.append(mainViewController!)
        sut = mainViewController

        let response = JSONHelper.getObjectFrom(json: "heroesList", type: MarvelResponse<SuperheroResponse>.self)!
        let model = response.data?.results?.compactMap({ $0.parse() }) ?? []
        sut.heroesDataSource = model

        _ = sut.view
    }

    func testViewDidLoadLoadThePresenter() throws {
        sut.viewDidLoad()
        XCTAssertNotNil(sut.presenter)
    }

    func testViewDidLoadSetCorrectTitle() throws {
        sut.viewDidLoad()
        XCTAssertEqual(sut.title, "Marvel")
    }

    func testPrepareForSegueSetTheResultDelegateOnTheHeroDetailsVC() throws {
        let destinationVC = SuperHeroDetailsViewController()
        let segue = UIStoryboardSegue(identifier: "showHeroDetails", source: sut, destination: destinationVC)

        sut.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        sut.prepare(for: segue, sender: nil)

        XCTAssertNotNil(destinationVC.superhero)
    }

    func testTableViewHaveTheCorrectAmmountOfRows() throws {
        sut.viewDidLoad()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }

    func testTableViewHaveTheCorrectAmmountOfSections() throws {
        sut.viewDidLoad()
        XCTAssertEqual(sut.tableView.numberOfSections, 1)
    }
}
