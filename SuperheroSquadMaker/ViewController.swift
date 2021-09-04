//
//  ViewController.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import UIKit

class ViewController: UIViewController {

    private let service = HeroesService()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.getAllSuperheroes { heroes in
            print(heroes.count)
        }
    }
}
