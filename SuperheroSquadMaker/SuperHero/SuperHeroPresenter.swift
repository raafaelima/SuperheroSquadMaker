//
//  SuperHeroPresenter.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 05/09/2021.
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
                OperationQueue.main.addOperation({
                    delegate?.showErrorAtLoadingHeroes()
                })
                return
            }

            if heroes.isEmpty {
                OperationQueue.main.addOperation({
                    delegate?.showEmptyDatasetMessage()
                })
                return
            }

            OperationQueue.main.addOperation({
                delegate?.loadHeroes(heroes: heroes)
            })
        }
    }
}
