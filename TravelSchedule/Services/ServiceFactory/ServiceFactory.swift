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
    case threadInformation
    case nearestSettlement
    case carriersInformation
    case stationsList
}

protocol APIService {
    var client: Client { get }
    var apikey: String { get }
}

actor ServiceFactory {
    static func createService(type: ServiceType, client: Client) -> APIService {
        let apikey = NetworkConstants.apiKey
        switch type {
        case .nearestStations:
            return NearestStationsService(client: client, apikey: apikey)
        case .pointToPoint:
            return PointToPointService(client: client, apikey: apikey)
        case .scheduleOnStation:
            return ScheduleOnStationService(client: client, apikey: apikey)
        case .threadInformation:
            return ThreadInformationService(client: client, apikey: apikey)
        case .nearestSettlement:
            return NearestSettlementService(client: client, apikey: apikey)
        case .carriersInformation:
            return CarriersInformationService(client: client, apikey: apikey)
        case .stationsList:
            return StationsListService(client: client, apikey: apikey)
        }
    }
}
