//
//  FromToView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 10.04.2024.
//

import SwiftUI

struct FromToView: View {
    
    @Binding var path: [String]
    @Binding var fromString: String
    @Binding var toString: String
    @Binding var isSearchButtonVisible: Bool
    
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                NavigationLink(value: "TopTextFieldView", label: {
                    TextFieldView(string: $fromString, type: .top)
                })
                NavigationLink(value: "BottomTextFieldView", label: {
                    TextFieldView(string: $toString, type: .bottom)
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
        NavigationLink(value: "SearchButtonView", label: {
            SearchButtonView()
        })
        .opacity(isSearchButtonVisible ? 1 : 0)
        .navigationDestination(for: String.self) { id in
            if id == "TopTextFieldView" {
                CitySelectionView(path: $path, fromString: $fromString, toString: $toString, isFromStringWasSelected: true)
                    .toolbarRole(.editor)
            }
            if id == "BottomTextFieldView" {
                CitySelectionView(path: $path, fromString: $fromString, toString: $toString, isFromStringWasSelected: false)
                    .toolbarRole(.editor)
            }
            if id == "SearchButtonView" {
                RoutesListView(fromToString: fromString + " → " + toString)
                    .toolbarRole(.editor)
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
    FromToView(path: ScheduleView(path: ContentView().$navPath).$path, fromString: ScheduleView(path: ContentView().$navPath).$fromString, toString: ScheduleView(path: ContentView().$navPath).$toString, isSearchButtonVisible: ScheduleView(path: ContentView().$navPath).$isSearchButtonVisible)
}
