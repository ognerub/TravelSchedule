//
//  StationSelectionViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import SwiftUI
import RealmSwift

class StationSelectionViewModel: ObservableObject {

    var selectedCity: RealmSettlement

    @Published var searchText: String = ""

    @ObservedResults(RealmSettlement.self) var settlements

    var filteredSettlement: Results<RealmSettlement> {
        settlements.filter("id = %@", selectedCity.id)
    }

    var filteredStations: [RealmStation] {
        let array = Array(filteredSettlement.flatMap { $0.stations })
        if searchText.isEmpty {
            return array
        } else {
            return array.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }

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
            return "Аэропорт"
        case "train_station":
            return "Вокзал"
        case "marine_station":
            return "Морской вокзал"
        case "river_port":
            return "Речной вокзал"
        case "station":
            return "Станция"
        case "bus_station":
            return "Автостанция"
        case "bus_stop":
            return "Автобусная остановка"
        case "stop":
            return "Остановка"
        case "platform":
            return "Платформа"
        case "port":
            return "Порт"
        case "wharf":
            return "Пристань"
        case "post":
            return "Пост"
        case "unknown":
            return ""
        default:
            return station_type
        }
    }

}
