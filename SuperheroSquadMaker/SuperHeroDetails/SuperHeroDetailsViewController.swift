//
//  SuperHeroDetailsViewController.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 05/09/2021.
//

import UIKit

class SuperHeroDetailsViewController: UIViewController, Storyboarded {

    var superhero: Superhero!
    var presenter: SuperHeroDetailsPresenter!
    weak var coordinator: MainCoordinator?

    // MARK: - Constants
    private let borderWidth: CGFloat = 3
    private let cornerRadius: CGFloat = 8
    private let redColor = UIColor(hex: "#f30c0bff")
    private let fireHeroFromSquad = "🔥 Fire from Squad"
    private let recruitHeroToSquad = "💪 Recruit to Squad"
    private let misteryDescription = "It's a Mistery for us all!"

    // MARK: - IB
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroDescription: UITextView!
    @IBOutlet weak var recruitToSquadButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = superhero.name
        presenter = SuperHeroDetailsPresenter()

        loadHeroInformation()
        applyRecruitState()
    }

    // MARK: - Hero Information

    private func loadHeroInformation() {
        self.heroName.text = superhero.name
        self.heroImage.loadThumbnail(from: superhero.profileImageURL)

        if superhero.biography.isEmpty {
            self.heroDescription.text = misteryDescription
        } else {
            self.heroDescription.text = superhero.biography
        }
    }

    // MARK: - Recruit Button States

    private func applyRecruitState() {
        superhero.isHiredToSquad ? applyHiredState() : applyNotRecruitedState()
    }

    private func applyNotRecruitedState() {
        recruitToSquadButton.backgroundColor = redColor
        recruitToSquadButton.layer.cornerRadius = cornerRadius
        recruitToSquadButton.setTitle(recruitHeroToSquad, for: .normal)
    }

    private func applyHiredState() {
        recruitToSquadButton.backgroundColor = .clear
        recruitToSquadButton.layer.borderWidth = borderWidth
        recruitToSquadButton.layer.cornerRadius = cornerRadius
        recruitToSquadButton.layer.borderColor = redColor?.cgColor
        recruitToSquadButton.setTitle(fireHeroFromSquad, for: .normal)
    }

    // MARK: - Recruit Action

    @IBAction func recruitOrFireSuperheroAction(_ sender: Any) {
        if !superhero.isHiredToSquad {
            presenter.updateHiringStatus(hero: superhero)
            applyRecruitState()
        } else {
            showFireHeroFromSquadAlert()
        }
    }

    private func showFireHeroFromSquadAlert() {
        let confirmFire = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.presenter.updateHiringStatus(hero: self.superhero)
            self.applyRecruitState()
        }

        let alert = AlertManager.shared.buildAlert(
            with: "Are you sure?",
            message: "Do you really want to fire \(superhero.name) from your squad?",
            action: confirmFire
        )
        self.present(alert, animated: true)
    }
}
