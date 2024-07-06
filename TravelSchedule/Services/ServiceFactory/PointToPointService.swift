//
//  ScheduleOfFlightsBetweenStationsService.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias PointToPoint = Components.Schemas.PointToPoint

protocol PointToPointProtocol {
    func getPointToPoint(from: String, to: String, page: String, date: String) async throws -> PointToPoint
}

final class PointToPointService: PointToPointProtocol, APIService {
    
    var client: Client
    var apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getPointToPoint(from: String, to: String, page: String, date: String) async throws -> PointToPoint {
        let response = try await client.getPointToPoint(query: .init(
            apikey: apikey,
            from: from,
            to: to,
            page: page,
            date: date,
            transfers: true
        ))
        return try response.ok.body.json
    }
}
