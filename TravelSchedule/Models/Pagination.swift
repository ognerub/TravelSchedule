//
//  Pagination.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation

struct Pagination: Codable {
    let total, limit, offset: Int
}
