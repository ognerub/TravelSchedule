//
//  Enum+Extension.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 12.07.2024.
//

import Foundation

extension Stations.latitudePayload {
    var doubleValue: Double? {
        switch self {
        case .case1(let value):
            return value
        case .case2(let value):
            return Double(value)
        }
    }
}

extension Stations.longitudePayload {
    var doubleValue: Double? {
        switch self {
        case .case1(let value):
            return value
        case .case2(let value):
            return Double(value)
        }
    }
}
