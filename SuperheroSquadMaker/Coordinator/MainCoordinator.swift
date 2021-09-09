//
//  MainCoordinator.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 09/09/2021.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = SuperHeroViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func details(of hero: Superhero) {
        let vc = SuperHeroDetailsViewController.instantiate()
        vc.superhero = hero
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
