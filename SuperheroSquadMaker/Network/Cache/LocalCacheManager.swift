//
//  LocalCacheManager.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 04/09/2021.
//

import Foundation

struct LocalCacheManager: CacheManager {

    private var storageManager: StorageManager

    init(storageManager: StorageManager = FileStorageManager()) {
        self.storageManager = storageManager
    }

    func save(onCache data: Data, at file: String) {
        do {
            try storageManager.save(data: data, on: file)
        } catch {
            print(error.localizedDescription)
        }
    }

    func load(from file: String) -> Data {
        do {
            return try storageManager.load(from: file)
        } catch {
            return Data()
        }
    }
}

