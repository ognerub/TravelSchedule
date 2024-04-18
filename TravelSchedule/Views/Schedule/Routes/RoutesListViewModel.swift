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
    
    func isAnyFilterOff(isMorningFilterOn: Bool, isAfternoonFilterOn: Bool, isEveningFilterOn: Bool, isNightFilterOn: Bool, isTransfersFilterOn: Bool) -> Bool {
        let summ: Int = (isMorningFilterOn ? 0 : 1) +
        (isAfternoonFilterOn ? 0 : 1) +
        (isEveningFilterOn ? 0 : 1) +
        (isNightFilterOn ? 0 : 1) +
        (isTransfersFilterOn ? 0 : 1)
        return summ > 0 ? true : false
    }
    
    func getFilteredRoutes(isMorningFilterOn: Bool, isAfternoonFilterOn: Bool, isEveningFilterOn: Bool, isNightFilterOn: Bool, isTransfersFilterOn: Bool) -> [RouteModel] {
        let startArray = routesArray
        let morningArray = isMorningFilterOn ? startArray.filter {
                guard let prefix = Int($0.startTime.prefix(2)) else { return false }
                if (prefix >= 6 && prefix < 12) { return true } else { return false }
        } : []
        let afternoonArray = isAfternoonFilterOn ? startArray.filter {
                guard let prefix = Int($0.startTime.prefix(2)) else { return false }
                if (prefix >= 12 && prefix < 18) { return true } else { return false }
        } : []
        let eveningArray = isEveningFilterOn ? startArray.filter {
                guard let prefix = Int($0.startTime.prefix(2)) else { return false }
                if (prefix >= 18 && prefix < 24) { return true } else { return false }
        } : []
        let nigthArray = isNightFilterOn ? startArray.filter {
                guard let prefix = Int($0.startTime.prefix(2)) else { return false }
                if (prefix >= 0 && prefix < 6) { return true } else { return false }
        } : []
        let summArray = morningArray + afternoonArray + eveningArray + nigthArray
        var finalArray = isTransfersFilterOn ? summArray : summArray.filter {
            $0.transfer == ""
        }
        finalArray.sort(by: { $0.date.prefix(2) < $1.date.prefix(2) } )
        return finalArray
    }
}
