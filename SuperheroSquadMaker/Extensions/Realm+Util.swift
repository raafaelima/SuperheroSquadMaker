//
//  Realm+Util.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 08/09/2021.
//

import Foundation
import RealmSwift

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for result in self {
            if let result = result as? T {
                array.append(result)
            }
        }
        return array
    }
}
