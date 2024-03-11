//
//  ServiceFactory.swift
//  TravelSchedule
//
//  Created by Ognerub on 11.03.2024.
//

import Foundation
import OpenAPIURLSession

enum ServiceType {
    case nearestStations
    case pointToPoint
    case scheduleOnStation
}

protocol APIService {
    var client: Client { get }
    var apikey: String { get }
}

class ServiceFactory {
    static func createService(type: ServiceType, client: Client) -> APIService {
        switch type {
        case .nearestStations:
            return NearestStationsService(client: client, apikey: NetworkConstants.apiKey)
        case .pointToPoint:
            return PointToPointService(client: client, apikey: NetworkConstants.apiKey)
        case .scheduleOnStation:
            return ScheduleOnStationService(client: client, apikey: NetworkConstants.apiKey)
        }
    }
}
