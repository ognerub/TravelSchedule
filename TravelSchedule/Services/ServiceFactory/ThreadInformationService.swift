//
//  ThreadInformationService.swift
//  TravelSchedule
//
//  Created by Ognerub on 11.03.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias ThreadInformation = Components.Schemas.ThreadInformation

protocol ThreadInformationServiceProtocol {
    func getThreadInformation(uid: String, show: String) async throws -> ThreadInformation
}

final class ThreadInformationService: ThreadInformationServiceProtocol, APIService {
    
    var client: Client
    var apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getThreadInformation(uid: String, show: String) async throws -> ThreadInformation {
        let response = try await client.getThreadInformation(query: .init(
            apikey: apikey,
            format: "json",
            uid: uid,
            lang: "ru_RU",
            show_systems: show
        ))
        return try response.ok.body.json
    }
}

