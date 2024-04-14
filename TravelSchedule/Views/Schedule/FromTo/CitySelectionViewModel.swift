//
//  CitySelectionViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import SwiftUI

class CitySelectionViewModel: ObservableObject {

    @Published var citiesArray: [CityModel] = [
        CityModel(id: UUID(), name: Localization.CitySelection.CitiesCodes.mow),
        CityModel(id: UUID(), name: Localization.CitySelection.CitiesCodes.led),
        CityModel(id: UUID(), name: Localization.CitySelection.CitiesCodes.aer),
        CityModel(id: UUID(), name: Localization.CitySelection.CitiesCodes.krr),
        CityModel(id: UUID(), name: Localization.CitySelection.CitiesCodes.kzn),
        CityModel(id: UUID(), name: Localization.CitySelection.CitiesCodes.oms)
    ]
    
    @Published var searchText: String = ""
    
    var filteredCities: [CityModel] {
            guard !searchText.isEmpty else { return citiesArray }
            return citiesArray.filter { city in
                city.name.lowercased().contains(searchText.lowercased())
            }
        }
}
