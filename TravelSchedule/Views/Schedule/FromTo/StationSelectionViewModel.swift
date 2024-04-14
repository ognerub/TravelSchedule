//
//  StationSelectionViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import SwiftUI

struct Station: Identifiable {
    let id: UUID
    let name: String
}

class StationSelectionViewModel: ObservableObject {

    @Published var stationsArray: [Station] = [
        Station(id: UUID(), name: "Kievsky railway station"),
        Station(id: UUID(), name: "Kursky railway station"),
        Station(id: UUID(), name: "Yaroslavsky railway station"),
        Station(id: UUID(), name: "Belorussky railway station"),
        Station(id: UUID(), name: "Savelovsky railway station"),
        Station(id: UUID(), name: "Leningradsky railway station")
    ]
    
    @Published var searchText: String = ""
    
    var filteredStations: [Station] {
            guard !searchText.isEmpty else { return stationsArray }
            return stationsArray.filter { station in
                station.name.lowercased().contains(searchText.lowercased())
            }
        }
}
