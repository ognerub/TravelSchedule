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
    //@Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            ForEach(viewModel.filteredStations) { station in
                Button(action: {
                    if isFromStringWasSelected {
                        fromString = selectedCity + " (" + station.name + ")"
                    } else {
                        toString = selectedCity + " (" + station.name + ")"
                    }
                    path.removeAll()
                    //dismiss()
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
        .listStyle(.plain)
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    StationSelectionView(
        path: ScheduleView(path: ContentView().$navPath).$path,
        fromString: ScheduleView(path: ContentView().$navPath).$fromString,
        toString: ScheduleView(path: ContentView().$navPath).$toString,
        isFromStringWasSelected: CitySelectionView(
            path: ContentView().$navPath,
            fromString: ScheduleView(path: ContentView().$navPath).$fromString,
            toString: ScheduleView(path: ContentView().$navPath).$toString,
            isFromStringWasSelected: true).$isFromStringWasSelected,
        selectedCity: "Moscow"
    )
}
