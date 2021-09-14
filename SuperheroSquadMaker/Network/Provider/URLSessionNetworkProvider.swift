//
//  URLSessionNetworkProvider.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

struct URLSessionNetworkProvider: NetworkProvider {

    var cacheManager: CacheManager
    var reachability: ReachabilityType

    init(reachability: ReachabilityType = Reachability(), cacheManager: CacheManager = LocalCacheManager()) {
        self.reachability = reachability
        self.cacheManager = cacheManager
    }

    func requestData<T: Codable>(from endpoint: Endpoint, completion: @escaping (Result<T, ApiError>) -> Void) {

        let session = URLSession(configuration: URLSessionConfiguration.ephemeral, delegate: NSURLSessionPinningDelegate(), delegateQueue: nil)

        let remoteDataTask = session.dataTask(with: endpoint.urlRequest()) { data, _, _ in

            guard let receivedData = data else {
                completion(.failure(.emptyData))
                return
            }

            self.cacheManager.save(onCache: receivedData)
            self.process(data: receivedData, completion)
        }

        remoteDataTask.resume()

        if self.reachability.currentStatus() == .notReachable {
            let cachedData = cacheManager.load()
            process(data: cachedData, completion)
        }
    }

    private func process<T: Codable>(data: Data, _ completion: @escaping (Result<T, ApiError>) -> Void) {
        do {
            let objectResponse = try JSONDecoder().decode(T.self, from: data)
            completion(.success(objectResponse))
        } catch {
            completion(.failure(.dataParsing))
        }
    }
}
