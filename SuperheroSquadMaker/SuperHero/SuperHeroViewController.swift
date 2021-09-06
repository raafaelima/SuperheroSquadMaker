//
//  SuperHeroViewController.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 05/09/2021.
//

import UIKit
import SwiftUI

class SuperHeroViewController: UITableViewController, SuperHeroView {

    private var isLoading = false
    internal var heroesDataSource = [Superhero]()
    internal var presenter: SuperHeroPresenter?

    private let loadingView: UIView = UIView()
    private var activityIndicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Marvel"

        self.setupActivityIndicator()

        self.presenter = SuperHeroPresenter(delegate: self)
        self.presenter?.getAllHeroes()
    }

    // MARK: - Loading Views

    private func setupActivityIndicator() {
        self.activityIndicatorView = UIActivityIndicatorView(style: .large)
        self.activityIndicatorView.hidesWhenStopped = true
        self.activityIndicatorView.center = self.view.center
        self.activityIndicatorView.startAnimating()

        self.loadingView.frame = self.view.frame
        self.loadingView.backgroundColor = .white
        self.loadingView.alpha = 0.4
        self.loadingView.addSubview(activityIndicatorView)

        self.tableView.addSubview(loadingView)
    }

    private func removeLoadingView() {
        self.activityIndicatorView.stopAnimating()
        self.loadingView.removeFromSuperview()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHeroDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailsVC = segue.destination as? SuperHeroDetailsViewController
                let hero = heroesDataSource[indexPath.row]
                detailsVC?.superhero = hero
            }
        }
    }

    // MARK: - Delegate Methods

    func loadHeroes(heroes: [Superhero]) {
        self.heroesDataSource = heroes
        self.tableView.reloadData()
        self.removeLoadingView()
    }

    func showErrorAtLoadingHeroes() {
        self.removeLoadingView()
        showNoDataConectionAlert()
    }

    func showEmptyDatasetMessage() {
        self.removeLoadingView()
        showNoInformationAlert()
    }

    private func showNoDataConectionAlert() {
        let alert = AlertManager.shared.buildAlert(with: "Oops!", and: "It appear that you are offline. We'll load the last data that you search so you can still see you favorite heroes.")
        self.present(alert, animated: true)
    }

    private func showNoInformationAlert() {
        let alert = AlertManager.shared.buildAlert(with: "Oops!", and: "There is no results for your search")
        self.present(alert, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesDataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell", for: indexPath) as? SuperHeroTableViewCell
        cell?.initView(hero: heroesDataSource[indexPath.row])
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showHeroDetails", sender: nil)
    }
}
