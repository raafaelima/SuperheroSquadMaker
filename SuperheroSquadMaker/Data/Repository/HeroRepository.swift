//
//  HeroRepository.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 08/09/2021.
//

import Foundation
import RealmSwift

class HeroRepository {

    private let database = RealmFactory.database()

    func empty() -> Bool {
        return database.objects(Superhero.self).isEmpty
    }

    func save(entiy: Superhero) {
        do {
            try database.write({ database.add(entiy) })
        } catch let error {
            print(error)
        }
    }

    func update(entiy: Superhero) {
        do {
            try database.write {
                let newFavoriteFlagStatus = entiy.isHiredToSquad ? false : true
                entiy.isHiredToSquad = newFavoriteFlagStatus
                database.add(entiy)
            }
        } catch {
            print(error)
            database.cancelWrite()
        }
    }

    func list() -> [Superhero] {
        return database.objects(Superhero.self).sorted(byKeyPath: "name", ascending: true).toArray(ofType: Superhero.self)
    }

    func listAllHired() -> [Superhero] {
        return database.objects(Superhero.self).filter("isHiredToSquad == true").toArray(ofType: Superhero.self)
    }
}
