//
//  CitySelectionView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 13.04.2024.
//

import SwiftUI

struct CitySelectionView: View {

    @ObservedObject var viewModel = CitySelectionViewModel()

    @Binding var path: [String]
    @Binding var fromString: (String, String)
    @Binding var toString: (String, String)

    @State var isFromStringWasSelected: Bool

    var body: some View {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.filteredSettlements) { settlement in
                        ZStack {
                            HStack {
                                Text(settlement.title)
                                Spacer()
                                Image(uiImage: UIImage.arrowRight)
                                    .resizable()
                                    .scaledToFit()
                                    .tint(Color.init(UIColor.blackDay))
                                    .frame(width: 11, height: 19)
                                    .padding(.trailing, 2.5)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            NavigationLink(destination: {
                                StationSelectionView(viewModel: StationSelectionViewModel(selectedCity: settlement), path: $path, fromString: $fromString, toString: $toString, isFromStringWasSelected: $isFromStringWasSelected)
                            }, label: {
                                Rectangle()
                                    .foregroundColor(.clear)
                            })
                        }
                    }
                    .frame(height: 60)
                }
                .padding(.horizontal, 16)
            }
        .navigationTitle(Localization.CitySelection.Navigation.title)
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    struct PreviewView: View {
        @StateObject var viewModel = CitySelectionViewModel()
        @State var path = [String]()
        @State var from = ("From", "")
        @State var to = ("To", "")
        var body: some View {
            CitySelectionView(viewModel: viewModel, path: $path, fromString: $from, toString: $to, isFromStringWasSelected: false)
        }
    }
    return PreviewView()
}
