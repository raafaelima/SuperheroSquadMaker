//
//  CacheManagerMock.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import Foundation

@testable import SuperheroSquadMaker

class CacheManagerMock: CacheManager {

    var didCallLoad = false
    var didCallSave = false

    func load(from file: String) -> Data {
        didCallSave = true
        return Data()
    }

    func save(onCache data: Data, at file: String) {
        didCallLoad = true
    }
}
