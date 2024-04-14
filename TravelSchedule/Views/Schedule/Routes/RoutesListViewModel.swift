//
//  CarriersListViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

class RoutesListViewModel: ObservableObject {
    
    @Published var routesArray: [RouteModel] = [
        RouteModel(id: UUID(), logo: "rzhd", company: "Russian Railways", transfer: "With a transfer in Kostroma", date: "14 january", startTime: "22:30", endTime: "08:15", duration: "20 hours"),
        RouteModel(id: UUID(), logo: "fgk", company: "FGK", transfer: "", date: "15 january", startTime: "01:15", endTime: "09:00", duration: "9 hours"),
        RouteModel(id: UUID(), logo: "url", company: "Ural Logistics", transfer: "", date: "16 january", startTime: "12:30", endTime: "21:00", duration: "9 hours"),
        RouteModel(id: UUID(), logo: "rzhd", company: "Russian Railways", transfer: "With a transfer in Kostroma", date: "17 january", startTime: "22:30", endTime: "08:15", duration: "20 hours"),
        RouteModel(id: UUID(), logo: "fgk", company: "FGK", transfer: "", date: "18 january", startTime: "01:15", endTime: "09:00", duration: "9 hours"),
        RouteModel(id: UUID(), logo: "url", company: "Ural Logistics", transfer: "", date: "19 january", startTime: "12:30", endTime: "21:00", duration: "9 hours"),
        RouteModel(id: UUID(), logo: "rzhd", company: "Russian Railways", transfer: "With a transfer in Kostroma", date: "20 january", startTime: "22:30", endTime: "08:15", duration: "20 hours"),
        RouteModel(id: UUID(), logo: "fgk", company: "FGK", transfer: "", date: "21 january", startTime: "01:15", endTime: "09:00", duration: "9 hours"),
        RouteModel(id: UUID(), logo: "url", company: "Ural Logistics", transfer: "", date: "22 january", startTime: "12:30", endTime: "21:00", duration: "9 hours")
    ]
    
}
