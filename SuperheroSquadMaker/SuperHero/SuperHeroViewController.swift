//
//  SuperHeroViewController.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 05/09/2021.
//

import UIKit

class SuperHeroViewController: UITableViewController, SuperHeroView, Storyboarded {

    private var isLoading = false
    private let loadingView: UIView = UIView()
    private var activityIndicatorView: UIActivityIndicatorView!

    internal var presenter: SuperHeroPresenter?
    internal var heroesDataSource = [Superhero]()
    internal var squadDataSource = [Superhero]()

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Marvel"

        self.setupActivityIndicator()
        self.presenter = SuperHeroPresenter(delegate: self)
        self.presenter?.getAllHeroes()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.squadDataSource = presenter?.getSquad() ?? []
        self.tableView.reloadData()
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

    // MARK: - Delegate Methods

    func loadHeroes(heroes: [Superhero]) {
        OperationQueue.main.addOperation({
            self.heroesDataSource = heroes
            self.tableView.reloadData()
            self.removeLoadingView()
        })
    }

    func showErrorAtLoadingHeroes() {
        OperationQueue.main.addOperation({
            self.removeLoadingView()
            self.showNoDataConectionAlert()
        })
    }

    func showEmptyDatasetMessage() {
        OperationQueue.main.addOperation({
            self.removeLoadingView()
            self.showNoInformationAlert()
        })
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

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if isAnyHeroHired() {
            let squadView = SquadView()
            squadView.coordinator = coordinator
            squadView.loadSquad(squad: squadDataSource)
            return squadView
        } else {
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return isAnyHeroHired() ? 180 : 0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hero = heroesDataSource[indexPath.row]
        self.coordinator?.details(of: hero)
    }

    private func isAnyHeroHired() -> Bool {
        return !squadDataSource.isEmpty
    }
}
