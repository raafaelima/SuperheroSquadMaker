//
//  URLSessionNetworkProviderMock.swift
//  SuperheroSquadMakerTests
//
//  Created by Rafael Lima on 05/09/2021.
//

import Foundation

@testable import SuperheroSquadMaker

class URLSessionNetworkProviderMock: NetworkProvider {

    var jsonFile = ""
    var forceError = false
    var responseEmpty = false
    var didCallRequestData = false
    var endpointRequestURL = ""
    var cacheManager: CacheManager = CacheManagerMock()
    var reachability: ReachabilityType = ReachabilityMock()

    func requestData<T: Codable>(from endpoint: Endpoint, completion: @escaping (Result<T, ApiError>) -> Void) {
        self.didCallRequestData = true
        self.endpointRequestURL = endpoint.urlRequest().url!.absoluteString

        if forceError {
            completion(.failure(.apiFailure))
        } else {
            if responseEmpty {
                let response = JSONHelper.getObjectFrom(json: "marvelData", type: T.self)!
                completion(.success(response))
            } else {
                let response = JSONHelper.getObjectFrom(json: jsonFile, type: T.self)!
                completion(.success(response))
            }
        }
    }
}
