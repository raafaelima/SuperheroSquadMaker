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
    private let repository: HeroRepository

    init(delegate: SuperHeroView, service: HeroesService = HeroesService(), repository: HeroRepository = HeroRepository()) {
        self.delegate = delegate
        self.heroService = service
        self.repository = repository
    }

    func getAllHeroes() {
        if !repository.empty() {
            loadHeroesFromRepo()
        } else {
            loadHeroesFromRemote()
        }
    }

    func getSquad() -> [Superhero] {
        return repository.listAllHired()
    }

    private func loadHeroesFromRemote() {
        heroService.getAllSuperheroes { superheroes in
            guard let heroes = superheroes else {
                delegate?.showErrorAtLoadingHeroes()
                return
            }

            presentHeroes(heroes: heroes)
            save(heroes)
        }
    }

    private func loadHeroesFromRepo() {
        let heroes = repository.list()
        presentHeroes(heroes: heroes)
    }

    private func presentHeroes(heroes: [Superhero]) {
        if heroes.isEmpty {
            delegate?.showEmptyDatasetMessage()
            return
        }

        delegate?.loadHeroes(heroes: heroes)
    }

    private func save(_ heroes: [Superhero]) {
        OperationQueue.main.addOperation({
            heroes.forEach { hero in
                repository.save(entiy: hero)
            }
        })
    }
}
