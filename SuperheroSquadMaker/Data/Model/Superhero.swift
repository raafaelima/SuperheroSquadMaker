//
//  Heroe.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation
import RealmSwift

class Superhero: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var biography: String = ""
    @objc dynamic var modified: String = ""
    @objc dynamic var thumbnailURL: String = ""
    @objc dynamic var profileImageURL: String = ""
    @objc dynamic var isHiredToSquad: Bool = false

    override static func primaryKey() -> String? {
        return "id"
    }
}
