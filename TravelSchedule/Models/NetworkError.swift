//
//  NetworkError.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation

enum NetworkError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
}
