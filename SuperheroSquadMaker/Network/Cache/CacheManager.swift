//
//  CacheManager.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

protocol CacheManager {
    func load() -> Data
    func save(onCache data: Data)
}
