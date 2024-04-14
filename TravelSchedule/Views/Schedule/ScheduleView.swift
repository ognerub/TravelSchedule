//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import SwiftUI

struct ScheduleView: View {
    
    @Binding var path: [String]
    
    @StateObject var viewModel = ScheduleViewModel()
    
    @State var isSearchButtonVisible: Bool = false
    @State var fromString: String = Localization.Schedule.FromToView.from
    @State var toString: String = Localization.Schedule.FromToView.to
    
    var body: some View {
        VStack {
            StoriesView()
            FromToView(path: $path, fromString: $fromString, toString: $toString)
            SearchButtonView()
                .opacity(isSearchButtonVisible ? 1 : 0)
            Spacer()
        }
        .onAppear {
            if fromString != Localization.Schedule.FromToView.from && toString != Localization.Schedule.FromToView.to {
                isSearchButtonVisible = true
            } else {
                isSearchButtonVisible = false
            }
        }
    }
    
    private func printButton() {
        print("button")
    }
}

#Preview {
    ScheduleView(path: ContentView().$navPath)
}