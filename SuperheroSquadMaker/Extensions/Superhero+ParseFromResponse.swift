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
            thumbnailURL: thumbnailURL(),
            profileImageURL: profileURL()
        )
    }

    private func thumbnailURL() -> String {
        return buildImageURL(isThumbnail: true)
    }

    private func profileURL() -> String {
        return buildImageURL(isThumbnail: false)
    }

    private func buildImageURL(isThumbnail: Bool) -> String {

        let thumbnail = "/portrait_incredible."
        let standard = "/standard_fantastic."

        guard let path = self.thumbnail?.path, let ext = self.thumbnail?.ext else {
            return ""
        }
        let securePath = path.replacingOccurrences(of: "http", with: "https", options: .literal, range: nil)

        if isThumbnail {
            return securePath + thumbnail + ext
        } else {
            return securePath + standard + ext
        }
    }
}
