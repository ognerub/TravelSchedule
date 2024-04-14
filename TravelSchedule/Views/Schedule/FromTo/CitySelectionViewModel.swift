//
//  CitySelectionViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import SwiftUI

struct City: Identifiable {
    let id: UUID
    let name: String
}

class CitySelectionViewModel: ObservableObject {

    @Published var citiesArray: [City] = [
        City(id: UUID(), name: Localization.CitySelection.CitiesCodes.mow),
        City(id: UUID(), name: Localization.CitySelection.CitiesCodes.led),
        City(id: UUID(), name: Localization.CitySelection.CitiesCodes.aer),
        City(id: UUID(), name: Localization.CitySelection.CitiesCodes.krr),
        City(id: UUID(), name: Localization.CitySelection.CitiesCodes.kzn),
        City(id: UUID(), name: Localization.CitySelection.CitiesCodes.oms)
    ]
    
    @Published var searchText: String = ""
    
    var filteredCities: [City] {
            guard !searchText.isEmpty else { return citiesArray }
            return citiesArray.filter { city in
                city.name.lowercased().contains(searchText.lowercased())
            }
        }
}
