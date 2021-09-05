//
//  SuperHeroView.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 05/09/2021.
//

protocol SuperHeroView: AnyObject {
    func loadHeroes(heroes: [Superhero])
    func showErrorAtLoadingHeroes()
    func showEmptyDatasetMessage()
}
