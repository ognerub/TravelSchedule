//
//  NearestStationViewModel.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation

// MARK: - NearestStations
struct ApiResponse: Codable {
    let pagination: Pagination
    let stations: [Station]
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, limit, offset: Int
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
