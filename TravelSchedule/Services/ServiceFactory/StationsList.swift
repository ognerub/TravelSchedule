//
//  StationsListService.swift
//  TravelSchedule
//
//  Created by Ognerub on 12.03.2024.
//

import Combine
import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias StationsList = Components.Schemas.StationsList
typealias Countries = StationsList.countriesPayloadPayload
typealias Regions = Countries.regionsPayloadPayload
typealias Settlements = Regions.settlementsPayloadPayload
typealias Stations = Settlements.stationsPayloadPayload

protocol StationsListServiceProtocol {
    func getListOfAllStations() async throws -> StationsList
}

final class StationsListService: Sendable, StationsListServiceProtocol, APIService {
    let client: Client
    let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    @Sendable
    func getListOfAllStations() async throws -> StationsList {
        print("create response")
        async let response = client.getStationsList(
            query: .init(
                apikey: apikey,
                lang: "ru_RU",
                format: "json"
            )
        )
        print("try httpBody")
        let httpBody = try await response.ok.body.html
        print("try data 1024")
        let data = try await Data(collecting: httpBody, upTo: 100 * 1024 * 1024)
        print("try decode")
        let stationList = try JSONDecoder().decode(StationsList.self, from: data)
        print("return stations")
        return stationList
    }
}

extension JSONDecoder {
    func decode<T: Decodable>(from httpBody: HTTPBody, to type: T.Type, upTo maxBytes: Int = 100 * 1024 * 1024) async throws -> T {
        let data = try await Data(collecting: httpBody, upTo: maxBytes)
        return try self.decode(T.self, from: data)
    }
}
