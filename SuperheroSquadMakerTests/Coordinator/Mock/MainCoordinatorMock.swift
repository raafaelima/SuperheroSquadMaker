//
//  MainCoordinatorMock.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 14/09/2021.
//

import Foundation

@testable import SuperheroSquadMaker

class MainCoordinatorMock: MainCoordinator {

    var didCallStart = false
    var didCallDetails = false

    override func start() {
        self.didCallStart = true
    }

    override func details(of hero: Superhero) {
        self.didCallDetails = true
    }
}
