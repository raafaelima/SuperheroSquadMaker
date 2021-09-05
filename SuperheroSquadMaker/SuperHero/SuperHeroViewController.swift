//
//  SuperHeroViewController.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 05/09/2021.
//

import UIKit

class SuperHeroViewController: UITableViewController, SuperHeroView {

    private var isLoading = false
    private var heroesDataSource = [Superhero]()
    private var presenter: SuperHeroPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = SuperHeroPresenter(delegate: self)
        self.presenter?.getAllHeroes()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

    // MARK: - Delegate Methods

    func loadHeroes(heroes: [Superhero]) {
        OperationQueue.main.addOperation({
            self.heroesDataSource = heroes
            self.tableView.reloadData()
        })
    }

    func showErrorAtLoadingHeroes() {
        // TODO: TBD
    }

    func showEmptyDatasetMessage() {
        // TODO: TBD
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
}
