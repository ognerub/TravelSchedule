//
//  ScheduleOfFlightsBetweenStations.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation

// MARK: - NearestStations
struct PointToPointResponse: Codable {
    let pagination: Pagination
    let intervalSegments: [IntervalSegment]
    let segments: [Segment]
    let search: Search

    enum CodingKeys: String, CodingKey {
        case pagination
        case intervalSegments = "interval_segments"
        case segments, search
    }
}

// MARK: - IntervalSegment
struct IntervalSegment: Codable {
    let from: IntervalSegmentFrom
    let thread: Thread
    let departurePlatform, stops: String
    let departureTerminal: JSONNull?
    let to: IntervalSegmentFrom
    let hasTransfers: Bool
    let ticketsInfo: TicketsInfo
    let duration: Int
    let arrivalTerminal, startDate, arrivalPlatform: String

    enum CodingKeys: String, CodingKey {
        case from, thread
        case departurePlatform = "departure_platform"
        case stops
        case departureTerminal = "departure_terminal"
        case to
        case hasTransfers = "has_transfers"
        case ticketsInfo = "tickets_info"
        case duration
        case arrivalTerminal = "arrival_terminal"
        case startDate = "start_date"
        case arrivalPlatform = "arrival_platform"
    }
}

// MARK: - IntervalSegmentFrom
struct IntervalSegmentFrom: Codable {
    let code, title, popularTitle, shortTitle: String
    let transportType, type, stationType, stationTypeName: String

    enum CodingKeys: String, CodingKey {
        case code, title
        case popularTitle = "popular_title"
        case shortTitle = "short_title"
        case transportType = "transport_type"
        case type
        case stationType = "station_type"
        case stationTypeName = "station_type_name"
    }
}

// MARK: - Thread
struct Thread: Codable {
    let uid, title: String
    let interval: Interval?
    let number, shortTitle, threadMethodLink: String
    let carrier: Carrier
    let transportType, vehicle: String
    let transportSubtype: TransportSubtype
    let expressType: String?

    enum CodingKeys: String, CodingKey {
        case uid, title, interval, number
        case shortTitle = "short_title"
        case threadMethodLink = "thread_method_link"
        case carrier
        case transportType = "transport_type"
        case vehicle
        case transportSubtype = "transport_subtype"
        case expressType = "express_type"
    }
}

// MARK: - Carrier
struct Carrier: Codable {
    let code: Int
    let contacts: String
    let url: String
    let logoSVG: JSONNull?
    let title, phone: String
    let codes: Codes
    let address, logo, email: String

    enum CodingKeys: String, CodingKey {
        case code, contacts, url
        case logoSVG = "logo_svg"
        case title, phone, codes, address, logo, email
    }
}

// MARK: - Codes
struct Codes: Codable {
    let icao: JSONNull?
    let sirena, iata: String
}

// MARK: - Interval
struct Interval: Codable {
    let density, endTime, beginTime: String

    enum CodingKeys: String, CodingKey {
        case density
        case endTime = "end_time"
        case beginTime = "begin_time"
    }
}

// MARK: - TransportSubtype
struct TransportSubtype: Codable {
    let color, code, title: String
}

// MARK: - TicketsInfo
struct TicketsInfo: Codable {
    let etMarker: Bool
    let places: [Place]

    enum CodingKeys: String, CodingKey {
        case etMarker = "et_marker"
        case places
    }
}

// MARK: - Place
struct Place: Codable {
    let currency: String
    let price: Price
    let name: String
}

// MARK: - Price
struct Price: Codable {
    let cents, whole: Int
}

// MARK: - Search
struct Search: Codable {
    let date: String
    let to, from: SearchFrom
}

// MARK: - SearchFrom
struct SearchFrom: Codable {
    let code, type, popularTitle, shortTitle: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case code, type
        case popularTitle = "popular_title"
        case shortTitle = "short_title"
        case title
    }
}

// MARK: - Segment
struct Segment: Codable {
    let arrival: Date
    let from: IntervalSegmentFrom?
    let thread: Thread?
    let departurePlatform: String?
    let departure: Date?
    let stops: String?
    let departureTerminal: JSONNull?
    let to: IntervalSegmentFrom?
    let hasTransfers: Bool?
    let ticketsInfo: TicketsInfo?
    let duration: Int?
    let arrivalTerminal, startDate, arrivalPlatform, empty: String?

    enum CodingKeys: String, CodingKey {
        case arrival, from, thread
        case departurePlatform = "departure_platform"
        case departure, stops
        case departureTerminal = "departure_terminal"
        case to
        case hasTransfers = "has_transfers"
        case ticketsInfo = "tickets_info"
        case duration
        case arrivalTerminal = "arrival_terminal"
        case startDate = "start_date"
        case arrivalPlatform = "arrival_platform"
        case empty = "..."
    }
}
