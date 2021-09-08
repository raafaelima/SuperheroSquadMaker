//
//  RealmFactory.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 08/09/2021.
//

import Foundation
import RealmSwift

struct RealmFactory {

    static func database() -> Realm {
        let configuration = Realm.Configuration(schemaVersion: 1)
        do {
            let realm = try Realm(configuration: configuration)
            try FileManager.default.setAttributes(
                [FileAttributeKey.protectionKey: FileProtectionType.none],
                ofItemAtPath: realm.configuration.fileURL!.deletingLastPathComponent().path
            )
            return realm
        } catch {
            deleteAll()
            return database()
        }
    }

    static func deleteAll() {
        if let url = Realm.Configuration.defaultConfiguration.fileURL {
            try? FileManager.default.removeItem(at: url)
        }
    }
}
