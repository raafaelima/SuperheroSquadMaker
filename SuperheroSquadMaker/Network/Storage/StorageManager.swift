//
//  StorageManager.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 04/09/2021.
//

import Foundation

protocol StorageManager: AnyObject {
    func save(data: Data, on key: String) throws
    func load(from key: String) throws -> Data
}
