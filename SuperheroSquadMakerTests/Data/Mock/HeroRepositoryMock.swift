//
//  HeroRepositoryMock.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 14/09/2021.
//

import Foundation
@testable import SuperheroSquadMaker

class HeroRepositoryMock: HeroRepository {

    var didCallEmpty = false
    var didCallSave = false
    var didCallUpdate = false
    var didCallList = false
    var didCallListAllHired = false

    var forceEmpty = false

    override func empty() -> Bool {
        self.didCallEmpty = true
        return forceEmpty
    }

    override func save(entiy: Superhero) {
        self.didCallSave = true
    }

    override func update(entiy: Superhero) {
        self.didCallUpdate = true
    }

    override func list() -> [Superhero] {
        self.didCallList = true

        if forceEmpty {
            return []
        } else {
            return [Superhero()]
        }
    }

    override func listAllHired() -> [Superhero] {
        self.didCallListAllHired = true

        if forceEmpty {
            return []
        } else {
            return [Superhero()]
        }
    }
}
