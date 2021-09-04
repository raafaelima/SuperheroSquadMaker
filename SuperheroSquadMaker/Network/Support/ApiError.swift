//
//  ApiError.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 04/09/2021.
//

import Foundation

enum ApiError: Error {
    case urlCreation
    case dataParsing
    case emptyData
    case apiFailure
}
