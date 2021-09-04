//
//  Superhero+ParseFromResponse.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

extension SuperheroResponse {
    func parse() -> Superhero {
        return Superhero(
            id: self.id,
            name: self.name,
            description: self.description,
            modified: self.modified,
            resourceURI: self.resourceURI
        )
    }
}
