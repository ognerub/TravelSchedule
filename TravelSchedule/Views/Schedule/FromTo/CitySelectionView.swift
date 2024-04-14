//
//  CitySelectionView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import SwiftUI

struct CitySelectionView: View {
    
    @Binding var path: [String]
    @Binding var fromString: String
    @Binding var toString: String
    
    @State var isFromStringWasSelected: Bool
    
    @StateObject var viewModel = CitySelectionViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.filteredCities) { city in
                HStack {
                    Text(city.name)
                    Spacer()
                    Image(uiImage: UIImage.arrowRight)
                        .tint(Color.init(UIColor.blackDay))
                }
                .background(
                    NavigationLink(city.name, destination: StationSelectionView(path: $path, fromString: $fromString, toString: $toString, isFromStringWasSelected: $isFromStringWasSelected, selectedCity: city.name)
                    )
                )
            }
            .frame(height: 60)
            .listRowSeparator(.hidden, edges: .all)
        }
        .navigationTitle(Localization.CitySelection.Navigation.title)
        .listStyle(.plain)
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    CitySelectionView(path: ScheduleView(path: ContentView().$navPath, fromString: "From", toString: "To").$path, fromString: ScheduleView(path: ContentView().$navPath, fromString: "From", toString: "To").$fromString, toString: ScheduleView(path: ContentView().$navPath, fromString: "From", toString: "To").$toString, isFromStringWasSelected: true)
}
