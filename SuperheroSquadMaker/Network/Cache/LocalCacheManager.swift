//
//  LocalCacheManager.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

struct LocalCacheManager: CacheManager {

    private let cacheFile = "local_cache.json"
    private var storageManager: StorageManager

    init(storageManager: StorageManager = FileStorageManager()) {
        self.storageManager = storageManager
    }

    func save(onCache data: Data) {
        do {
            try storageManager.save(data: data, on: cacheFile)
        } catch {
            print(error.localizedDescription)
        }
    }

    func load() -> Data {
        do {
            return try storageManager.load(from: cacheFile)
        } catch {
            return Data()
        }
    }
}
