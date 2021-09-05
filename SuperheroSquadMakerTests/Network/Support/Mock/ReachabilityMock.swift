//
//  ReachabilityMock.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import Foundation

@testable import SuperheroSquadMaker

class ReachabilityMock: ReachabilityType {

    var forceError: Bool = false
    var didCallStatus = false

    func currentStatus() -> ReachabilityStatus {
        didCallStatus = true
        return forceError ? .notReachable : .reachableViaWiFi
    }
}
