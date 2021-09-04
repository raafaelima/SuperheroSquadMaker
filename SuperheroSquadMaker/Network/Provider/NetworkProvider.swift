//
//  NetworkProvider.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 04/09/2021.
//

import Foundation

protocol NetworkProvider {
    var reachability: ReachabilityType { get }
    var cacheManager: CacheManager { get }

    func requestData<T: Codable>(from endpoint: Endpoint, completion: @escaping (Result<T, ApiError>) -> Void)
}
