//
//  Service.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

protocol Service: AnyObject {
    var networkProvider: NetworkProvider { get set }
}
