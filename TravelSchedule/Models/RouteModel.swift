//
//  RoutModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

struct RouteModel: Identifiable {
    let id: UUID
    let logo: (String, LogoImageType)
    let transfer: String
    let date: String
    let startTime: String
    let endTime: String
    let duration: String
    let companyTitle: String
    let companyPhone: String
    let companyEmail: String
}
