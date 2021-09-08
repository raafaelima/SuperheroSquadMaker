//
//  SuperHeroDetailsPresenter.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 08/09/2021.
//

import Foundation

struct SuperHeroDetailsPresenter {

    private let repository: HeroRepository

    init(repository: HeroRepository = HeroRepository()) {
        self.repository = repository
    }

    func updateHiringStatus(hero: Superhero) {
        repository.update(entiy: hero)
    }
}
