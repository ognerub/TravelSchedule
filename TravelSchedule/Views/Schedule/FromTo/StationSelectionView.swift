//
//  StationSelectionView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import SwiftUI

struct StationSelectionView: View {
    
    @Binding var path: [String]
    @Binding var fromString: String
    @Binding var toString: String
    @Binding var isFromStringWasSelected: Bool
    @State var selectedCity: String
    
    @StateObject var viewModel = StationSelectionViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.getFilteredStations(by: selectedCity)) { station in
                Button(action: {
                    if isFromStringWasSelected {
                        fromString = selectedCity + " (" + station.name + ")"
                    } else {
                        toString = selectedCity + " (" + station.name + ")"
                    }
                    path.removeAll()
                } ) {
                    HStack {
                        Text(station.name)
                        Spacer()
                        Image(uiImage: UIImage.arrowRight)
                            .tint(Color.init(UIColor.blackDay))
                    }
                }
            }
            .frame(height: 60)
            .listRowSeparator(.hidden, edges: .all)
        }
        .navigationTitle(Localization.StationSelection.Navigation.title)
        .toolbarRole(.editor)
        .listStyle(.plain)
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    StationSelectionView(path: ScheduleView(path: ContentView().$navPath, fromString: "From", toString: "To").$path, fromString: ScheduleView(path: ContentView().$navPath, fromString: "From", toString: "To").$fromString, toString: ScheduleView(path: ContentView().$navPath, fromString: "From", toString: "To").$toString, isFromStringWasSelected: ScheduleView(path: ContentView().$navPath, fromString: "From", toString: "To").$isSearchButtonVisible, selectedCity: "Moscow")
}
