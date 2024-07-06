//
//  StationSelectionView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import SwiftUI

struct StationSelectionView: View {

    @ObservedObject var viewModel: StationSelectionViewModel

    @Binding var path: [String]
    @Binding var fromString: (String, String)
    @Binding var toString: (String, String)
    @Binding var isFromStringWasSelected: Bool

    var body: some View {
        List {
            ForEach(viewModel.filteredStations) { station in
                
                Button(action: {
                    if isFromStringWasSelected {
                        fromString.0 = viewModel.getFinalString(station: station)
                        fromString.1 = station.codes?.yandex_code ?? station.codes?.esr_code ?? ""
                    } else {
                        toString.0 = viewModel.getFinalString(station: station)
                        toString.1 = station.codes?.yandex_code ?? station.codes?.esr_code ?? ""
                    }
                    path.removeAll()
                } ) {
                    HStack {
                        Text(viewModel.getFullNameOf(station: station))
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
    struct PreviewView: View {
        @State var path = [String]()
        @State var from = ("From", "")
        @State var to = ("To", "")
        @State var isFromStringWasSelected = false
        let selectedCity = RealmSettlement()
        var body: some View {
            StationSelectionView(viewModel: StationSelectionViewModel(selectedCity: selectedCity), path: $path, fromString: $from, toString: $to, isFromStringWasSelected: $isFromStringWasSelected)
        }
    }
    return PreviewView()
}
