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

    func load() -> Data {
        didCallSave = true
        return Data()
    }

    func save(onCache data: Data) {
        didCallLoad = true
    }
}
