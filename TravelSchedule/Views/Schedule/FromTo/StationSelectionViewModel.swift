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
    let city: String
}

class StationSelectionViewModel: ObservableObject {
    
    @Published var stationsArray: [Station] = [
        // Moscow
        Station(id: UUID(), name: "Kievsky railway station", city: Localization.CitySelection.CitiesCodes.mow),
        Station(id: UUID(), name: "Kursky railway station", city: Localization.CitySelection.CitiesCodes.mow),
        Station(id: UUID(), name: "Yaroslavsky railway station", city: Localization.CitySelection.CitiesCodes.mow),
        Station(id: UUID(), name: "Belorussky railway station", city: Localization.CitySelection.CitiesCodes.mow),
        Station(id: UUID(), name: "Savelovsky railway station", city: Localization.CitySelection.CitiesCodes.mow),
        Station(id: UUID(), name: "Leningradsky railway station", city: Localization.CitySelection.CitiesCodes.mow),
        // Saint-Petersburg
        Station(id: UUID(), name: "Moskovsky railway station", city: Localization.CitySelection.CitiesCodes.led),
        Station(id: UUID(), name: "Finlyandsky railway station", city: Localization.CitySelection.CitiesCodes.led),
        Station(id: UUID(), name: "Ladozhsky railway station", city: Localization.CitySelection.CitiesCodes.led),
        Station(id: UUID(), name: "Vitebsk railway station", city: Localization.CitySelection.CitiesCodes.led),
        Station(id: UUID(), name: "Baltiysky railway station", city: Localization.CitySelection.CitiesCodes.led),
        // Sochi
        Station(id: UUID(), name: "Sochi railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Adler railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Khost railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Olympic Park railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Gagra railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Loo railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Dagomys railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Rosa Khutor railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Esto-Sadok railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Veseloe railway station", city: Localization.CitySelection.CitiesCodes.aer),
        Station(id: UUID(), name: "Anchor Slot railway station", city: Localization.CitySelection.CitiesCodes.aer),
        // Krasnodar
        Station(id: UUID(), name: "Krasnodar-1 railway station", city: Localization.CitySelection.CitiesCodes.krr),
        Station(id: UUID(), name: "Krasnodar-2 railway station", city: Localization.CitySelection.CitiesCodes.krr),
        Station(id: UUID(), name: "Krasnodar marshalling yard railway station", city: Localization.CitySelection.CitiesCodes.krr),
        Station(id: UUID(), name: "Pashkovskaya railway station", city: Localization.CitySelection.CitiesCodes.krr),
        // Kazan
        Station(id: UUID(), name: "Kazan-1 railway station", city: Localization.CitySelection.CitiesCodes.kzn),
        Station(id: UUID(), name: "Kazan-2 railway station", city: Localization.CitySelection.CitiesCodes.kzn),
        // Omsk
        Station(id: UUID(), name: "Omsk railway station", city: Localization.CitySelection.CitiesCodes.oms),
        Station(id: UUID(), name: "Omsk suburb railway station", city: Localization.CitySelection.CitiesCodes.oms),
        Station(id: UUID(), name: "Karbyshevo-1 railway station", city: Localization.CitySelection.CitiesCodes.oms),
    ]
    
    @Published var searchText: String = ""
    
    func getFilteredStations(by city: String) -> [Station] {
        let filteredByCity = stationsArray.filter { station in
            station.city == city
        }
        guard !searchText.isEmpty else { return filteredByCity }
        return filteredByCity.filter { station in
            station.name.lowercased().contains(searchText.lowercased())
        }
    }
}
