//
//  Coordinator.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 09/09/2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
