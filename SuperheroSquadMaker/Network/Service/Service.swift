//
//  Service.swift
//  SuperheroSquadMaker
//
//  Created by CTW00710-Admin on 04/09/2021.
//

import Foundation

protocol Service: AnyObject {
    var networkProvider: NetworkProvider { get set }
}
