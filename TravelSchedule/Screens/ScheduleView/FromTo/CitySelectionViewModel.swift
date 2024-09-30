//
//  CitySelectionViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import Foundation
import RealmSwift

@MainActor
final class CitySelectionViewModel: Sendable, ObservableObject {

    @Published var searchText: String = ""
    @Published var isFromStringWasSelected: Bool
    
    init(isFromStringWasSelected: Bool) {
        self.isFromStringWasSelected = isFromStringWasSelected
    }

    @ObservedResults(RealmSettlement.self) var settlements

    var filteredSettlements: Results<RealmSettlement> {
        let settlements = settlements.filter("title != ''")
        if searchText.isEmpty {
            return settlements.sorted(byKeyPath: "stationsCount", ascending: false)
        } else {
            return settlements.filter("title CONTAINS[c] %@", searchText).sorted(byKeyPath: "stationsCount", ascending: false)
        }
    }
}
