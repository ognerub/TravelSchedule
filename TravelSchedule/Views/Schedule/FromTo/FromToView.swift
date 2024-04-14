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

struct TextFieldView: View {
    
    enum TextFieldType {
        case top
        case bottom
    }
    
    @Binding var string: String
    
    let type: TextFieldType
    
    var body: some View {
            TextField(
                string,
                text: $string
            )
            .multilineTextAlignment(.leading)
            .padding([.leading, .trailing], 16)
            .frame(height:48, alignment: .leading)
            .foregroundColor(Color.init((string == Localization.Schedule.FromToView.from || string == Localization.Schedule.FromToView.to) ? UIColor.greyUniversal : UIColor.blackUniversal))
            .background(Color.init(UIColor.white))
            .cornerRadius(16, corners: type == .top ? [.topLeft, .topRight] : [.bottomLeft, .bottomRight])
            .padding(EdgeInsets(top: type == .top ? 16 : 0, leading: 16, bottom: type == .top ? 0 : 16, trailing: 0))
            .disabled(true)
    }
}
