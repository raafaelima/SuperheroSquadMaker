//
//  SuperHeroDetailsViewController.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 05/09/2021.
//

import UIKit

class SuperHeroDetailsViewController: UIViewController {

    var superhero: Superhero!

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var recruitToSquadButton: UIButton!
    @IBOutlet weak var heroDescription: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = superhero.name
        loadHeroInformation()
    }

    private func loadHeroInformation() {
        self.heroName.text = superhero.name
        self.heroImage.loadThumbnail(from: superhero.profileImageURL)

        if superhero.description.isEmpty {
            self.heroDescription.text = "It's a Mistery for us all!"
        } else {
            self.heroDescription.text = superhero.description
        }
    }
}
