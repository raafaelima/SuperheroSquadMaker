//
//  AllCharactersService.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

import Foundation

class HeroesService: Service {

    var networkProvider: NetworkProvider

    init(networkProvider: NetworkProvider = URLSessionNetworkProvider()) {
        self.networkProvider = networkProvider
    }

    func getAllSuperheroes(completion: @escaping ([Superhero]?) -> Void) {
        let endpoint = AllHeroesEndpoint()
        networkProvider.requestData(from: endpoint) { (result: Result<MarvelResponse<SuperheroResponse>, ApiError>) in
            switch result {
            case .success(let characters):
                let superheroes = characters.data?.results?.compactMap({ $0.parse() }) ?? []
                completion(superheroes)
            case .failure(let error):
                print("Error at Loading Heroes: \(error)")
                completion(nil)
            }
        }
    }

    func getSuperheroDetails(id: Int, completion: @escaping (Superhero?) -> Void) {
        let endpoint = SuperheroEndpoint(heroId: id)
        networkProvider.requestData(from: endpoint) { (result: Result<MarvelResponse<SuperheroResponse>, ApiError>) in
            switch result {
            case .success(let characters):

                guard let results = characters.data?.results, !results.isEmpty else {
                    completion(nil)
                    return
                }

                let superhero = results.first?.parse()
                completion(superhero)

            case .failure(let error):
                print("Error at Loading Hero (\(id): \(error)")
                completion(nil)
            }
        }
    }
}
