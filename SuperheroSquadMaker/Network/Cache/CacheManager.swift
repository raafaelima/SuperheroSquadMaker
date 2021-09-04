//
//  CacheManager.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 04/09/2021.
//

import Foundation

protocol CacheManager {
    func load(from file: String) -> Data
    func save(onCache data: Data, at file: String)
}
