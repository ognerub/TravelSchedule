//
//  RoutModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

struct RouteModel: Identifiable {
    let id: UUID
    let logo: String
    let company: String
    let transfer: String
    let date: String
    let startTime: String
    let endTime: String
    let duration: String
}
