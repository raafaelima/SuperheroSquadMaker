//
//  SuperHeroPresenter.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 05/09/2021.
//

import Foundation

struct SuperHeroPresenter {

    weak var delegate: SuperHeroView?
    private let heroService: HeroesService

    init(delegate: SuperHeroView, service: HeroesService = HeroesService()) {
        self.delegate = delegate
        self.heroService = service
    }

    func getAllHeroes() {
        heroService.getAllSuperheroes { superheroes in

            guard let heroes = superheroes else {
                delegate?.showErrorAtLoadingHeroes()
                return
            }

            if heroes.isEmpty {
                delegate?.showEmptyDatasetMessage()
                return
            }

            delegate?.loadHeroes(heroes: heroes)
        }
    }
}
