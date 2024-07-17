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

final class StationsListService: @unchecked Sendable, StationsListServiceProtocol, APIService {
    let client: Client
    let  apikey: String



    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }

    func getListOfAllStationsCombine() -> AnyPublisher<StationsList, Error> {
        Deferred {
            Future { [weak self] promise in
                guard let self = self else {
                    promise(.failure(NSError(domain: "StationsService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Self is nil"])))
                    return
                }
                Task {
                    await self.getStationsList(promise: promise)
                }
            }
        }
        .eraseToAnyPublisher()
    }

    @Sendable
    private func getStationsList(promise: @escaping (Result<StationsList, Error>) -> Void) async {
        do {
            PrintManager.shared.print("create response")
            let response = try await client.getStationsList(
                query: .init(
                    apikey: apikey,
                    lang: "ru_RU",
                    format: "json"
                )
            )
            PrintManager.shared.print("try httpBody")
            let httpBody = try response.ok.body.html
            PrintManager.shared.print("try data 1024")
            let data = try await Data(collecting: httpBody, upTo: 100 * 1024 * 1024)
            PrintManager.shared.print("try decode")
            let stationList = try JSONDecoder().decode(StationsList.self, from: data)
            PrintManager.shared.print("return stations")
            promise(.success(stationList))
        } catch {
            promise(.failure(error))
        }
    }

    func  getListOfAllStations() async throws -> StationsList {
        print("create response")
        let response = try await client.getStationsList(
            query: .init(
                apikey: apikey,
                lang: "ru_RU",
                format: "json"
            )
        )
        print("try httpBody")
        let httpBody = try response.ok.body.html
        print("try data 1024")
        let data = try await Data(collecting: httpBody, upTo: 100 * 1024 * 1024)
        print("try decode")
        let stationList = try JSONDecoder().decode(StationsList.self, from: data)
        print("return stations")
        return stationList
    }
}

extension  JSONDecoder {
    func decode<T: Decodable>(from httpBody: HTTPBody, to type: T.Type, upTo maxBytes: Int = 100 * 1024 * 1024) async throws -> T {
        let data = try await Data(collecting: httpBody, upTo: maxBytes)
        return try self.decode(T.self, from: data)
    }
}




