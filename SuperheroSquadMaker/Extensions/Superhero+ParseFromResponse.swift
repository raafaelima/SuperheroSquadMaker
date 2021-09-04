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
            thumbnailURL: thumbnailURL()
        )
    }

    private func thumbnailURL() -> String {
        guard let path = self.thumbnail?.path, let ext = self.thumbnail?.ext else {
            return ""
        }

        return path + "/portrait_incredible." + ext
    }
}
