//
//  NetworkService.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 06.07.2024.
//

import Foundation
import OpenAPIURLSession

protocol NetworkServiceProtocol: Sendable {
    func createStationsListService() async -> StationsListService?
    func createPointToPointService() async -> PointToPointService?
}

actor NetworkService: Sendable, NetworkServiceProtocol {

    func createStationsListService() async -> StationsListService? {
        guard let service = create(service: .stationsList) as? StationsListService else { return nil }
        return service
    }
    
    func createPointToPointService() async -> PointToPointService? {
        guard let service = create(service: .pointToPoint) as? PointToPointService else { return nil }
        return service
    }
    
    private func create(service: ServiceType) -> APIService? {
        guard let url = try? Servers.server1() else {
            print("error url")
            return nil
        }
        let client = Client(
            serverURL: url,
            transport: URLSessionTransport()
        )
        let service = ServiceFactory.createService(
            type: service,
            client: client
        )
        return service
    }
}
