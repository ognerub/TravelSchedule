//
//  FromToView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 10.04.2024.
//

import SwiftUI

private enum NavigationIdentifiers: String {
    case topTextFieldView = "TopTextFieldView"
    case bottomTextFieldView = "BottomTextFieldView"
    case searchButtonView = "SearchButtonView"
}

struct FromToView: View {

    let networkService: NetworkServiceProtocol

    @Binding var path: [String]
    @Binding var fromString: (String, String)
    @Binding var toString: (String, String)
    @Binding var isSearchButtonVisible: Bool

    var body: some View {
        HStack {
            VStack(spacing: 0) {
                NavigationLink(value: NavigationIdentifiers.topTextFieldView.rawValue, label: {
                    TextFieldView(type: .top, string: $fromString.0)
                })
                NavigationLink(value: NavigationIdentifiers.bottomTextFieldView.rawValue, label: {
                    TextFieldView(type: .bottom, string: $toString.0)
                })
            }
            Button(action: switchFromAndToStrings) {
                Image(uiImage: UIImage.change)
                    .frame(width: 36, height: 36)
                    .padding(16)
            }
        }
        .background(Color.init(UIColor.blueUniversal))
        .cornerRadius(16)
        .padding(16)
        NavigationLink(value: NavigationIdentifiers.searchButtonView.rawValue, label: {
            SearchButtonView()
        })
        .opacity(isSearchButtonVisible ? 1 : 0)
        .navigationDestination(for: String.self) { id in
            switch id {
            case NavigationIdentifiers.topTextFieldView.rawValue:
                CitySelectionView(viewModel: CitySelectionViewModel(isFromStringWasSelected: true), path: $path, fromString: $fromString, toString: $toString)
                    .toolbarRole(.editor)
            case NavigationIdentifiers.bottomTextFieldView.rawValue:
                CitySelectionView(viewModel: CitySelectionViewModel(isFromStringWasSelected: false), path: $path, fromString: $fromString, toString: $toString)
                    .toolbarRole(.editor)
            case NavigationIdentifiers.searchButtonView.rawValue:
                RoutesListView(viewModel: RoutesListViewModel(fromCode: fromString.1, toCode: toString.1, fromToString: fromString.0 + " → " + toString.0, networkService: networkService))
                    .toolbarRole(.editor)
            default:
                CustomTextView(string: "Error navigation destination", size: 15, weight: .bold, color: UIColor.redUniversal)
            }
        }
    }

    private func switchFromAndToStrings() {
        let lastFromString = fromString
        fromString = toString
        toString = lastFromString
    }
}

#Preview {
    struct PreviewView: View {
        let networkService: NetworkServiceProtocol = NetworkService()
        @State private var path = [String]()
        @State private var from = ("From", "")
        @State private var to = ("To", "")
        @State private var isFromStringWasSelected = false
        let selectedCity = RealmSettlement()
        var body: some View {
            FromToView(networkService: networkService, path: $path, fromString: $from, toString: $to, isSearchButtonVisible: $isFromStringWasSelected)
        }
    }
    return PreviewView()
}

