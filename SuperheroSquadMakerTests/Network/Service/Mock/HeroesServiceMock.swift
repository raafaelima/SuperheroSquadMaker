//
//  HeroesServiceMock.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import Foundation

@testable import SuperheroSquadMaker

class HeroesServiceMock: HeroesService {

    var forceError = false
    var forceEmpty = false

    override func getAllSuperheroes(completion: @escaping ([Superhero]?) -> Void) {
        if forceEmpty {
            completion([])
        } else if forceError {
            completion(nil)
        } else {
            let response = JSONHelper.getObjectFrom(json: "heroesList", type: MarvelResponse<SuperheroResponse>.self)!
            let photos = response.data?.results?.compactMap({ $0.parse() })
            completion(photos)
        }
    }
}
