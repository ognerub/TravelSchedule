//
//  NearestStationViewModel.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation

// MARK: - NearestStations
struct NearestStationsResponse: Codable {
    let pagination: Pagination
    let stations: [Station]
}

// MARK: - Station
struct Station: Codable {
    let type, title: String
    let shortTitle, popularTitle: JSONNull?
    let code: String
    let lat, lng: Double
    let stationType, stationTypeName, transportType: String
    let distance: Double
    let majority: Int
    let typeChoices: TypeChoices

    enum CodingKeys: String, CodingKey {
        case type, title
        case shortTitle = "short_title"
        case popularTitle = "popular_title"
        case code, lat, lng
        case stationType = "station_type"
        case stationTypeName = "station_type_name"
        case transportType = "transport_type"
        case distance, majority
        case typeChoices = "type_choices"
    }
}

// MARK: - TypeChoices
struct TypeChoices: Codable {
    let schedule: Schedule
}

// MARK: - Schedule
struct Schedule: Codable {
    let desktopURL, touchURL: String

    enum CodingKeys: String, CodingKey {
        case desktopURL = "desktop_url"
        case touchURL = "touch_url"
    }
}
