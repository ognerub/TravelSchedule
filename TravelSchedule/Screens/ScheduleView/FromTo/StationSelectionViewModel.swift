//
//  StationSelectionViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import SwiftUI
import RealmSwift

@MainActor
final class StationSelectionViewModel: Sendable, ObservableObject {

    var selectedCity: RealmSettlement
    var filteredSettlement: Results<RealmSettlement> {
        settlements.filter("id = %@", selectedCity.id)
    }
    var filteredStations: [RealmStation] {
        let array = Array(filteredSettlement.flatMap { $0.stations })
        if searchText.isEmpty {
            return array.compactMap { $0 }
        } else {
            return array.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    @ObservedResults(RealmSettlement.self) var settlements
    @Published var searchText: String = ""

    init(selectedCity: RealmSettlement) {
        self.selectedCity = selectedCity
    }

    func getFullNameOf(station: RealmStation) -> String {
        let string = "\(getNameOf(station: station).isEmpty ? "" : getNameOf(station: station)+(station.station_type.isEmpty ? "" : ", "))\(getDescription(station_type: station.station_type))"
        return (string.last == " ") ? String(string.dropLast(2)) : string
    }

    func getFinalString(station: RealmStation) -> String {
        return "\(selectedCity.title) (\(getNameOf(station: station) == selectedCity.title ? getDescription(station_type: station.station_type) : getNameOf(station: station).isEmpty ? getDescription(station_type: station.station_type) : getNameOf(station: station)))"
    }

    private func getNameOf(station: RealmStation) -> String {
        let string = "\(station.title.slice(from: "(", to: ")") ?? station.title)".replacingOccurrences(of: selectedCity.title, with: "").replacingOccurrences(of: ",", with: "").trimmingCharacters(in: .whitespaces).capitalized
        return string.first == "-" ? selectedCity.title+string : string
    }

    private func getDescription(station_type: String) -> String {
        switch station_type {
        case "airport":
            return Localization.StationSelection.airport
        case "train_station":
            return Localization.StationSelection.trainStation
        case "marine_station":
            return Localization.StationSelection.marineStation
        case "river_port":
            return Localization.StationSelection.riverPort
        case "station":
            return Localization.StationSelection.station
        case "bus_station":
            return Localization.StationSelection.busStation
        case "bus_stop":
            return Localization.StationSelection.busStop
        case "stop":
            return Localization.StationSelection.stop
        case "platform":
            return Localization.StationSelection.platform
        case "port":
            return Localization.StationSelection.port
        case "wharf":
            return Localization.StationSelection.wharf
        case "post":
            return Localization.StationSelection.post
        case "unknown":
            return Localization.StationSelection.unknown
        default:
            return station_type
        }
    }

}
