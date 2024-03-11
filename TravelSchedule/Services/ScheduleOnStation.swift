//
//  ScheduleOnStation.swift
//  TravelSchedule
//
//  Created by Ognerub on 11.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias ScheduleOnStation = Components.Schemas.ScheduleOnStation

protocol ScheduleOnStationProtocol {
    func getScheduleOnStation(station: String, date: String) async throws -> ScheduleOnStation
}

final class ScheduleOnStationService: ScheduleOnStationProtocol, APIService {
    
    var client: Client
    var apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getScheduleOnStation(station: String, date: String) async throws -> ScheduleOnStation {
        let response = try await client.getScheduleOnStation(query: .init(
            apikey: apikey,
            station: station,
            date: date) )
        return try response.ok.body.json
    }
}
