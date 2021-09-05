//
//  SuperHeroViewControllerMock.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import Foundation

@testable import SuperheroSquadMaker

class SuperHeroViewControllerMock: SuperHeroView {

    var didCallLoadHeroes = false
    var didCallShowErrorAtLoadingHeroes = false
    var didCallShowEmptyDatasetMessage = false

    func loadHeroes(heroes: [Superhero]) {
        self.didCallLoadHeroes = true
    }

    func showErrorAtLoadingHeroes() {
        self.didCallShowErrorAtLoadingHeroes = true
    }

    func showEmptyDatasetMessage() {
        self.didCallShowEmptyDatasetMessage = true
    }

}
