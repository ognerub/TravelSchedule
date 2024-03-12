//
//  CarriersInformationService.swift
//  TravelSchedule
//
//  Created by Ognerub on 12.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias CarriersInformation = Components.Schemas.Carriers

protocol CarriersInformationServiceProtocol {
    func getCarriersInformation(code: String, system: String) async throws -> CarriersInformation
}

final class CarriersInformationService: CarriersInformationServiceProtocol, APIService {
    
    var client: Client
    var apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCarriersInformation(code: String, system: String) async throws -> CarriersInformation {
        let response = try await client.getCarriers(
            query: .init(
                format: "json",
                apikey: apikey,
                lang: "ru_RU",
                code: code,
                system: system
            ))
        return try response.ok.body.json
    }
}



