//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import SwiftUI

struct ScheduleView: View {
    
    @ObservedObject var viewModel = StoriesViewModel()
    @Binding var path: [String]
    @State var isSearchButtonVisible: Bool = false
    @State var fromString: (String, String) = (Localization.Schedule.FromToView.from, "")
    @State var toString: (String, String) = (Localization.Schedule.FromToView.to, "")
    @State private var isStoriesPresented = false
    
    var body: some View {
        VStack {
           StoriesView(viewModel: viewModel, isStoriesPresented: $isStoriesPresented, timerConfiguration: TimerConfiguration(storiesCount: viewModel.stories.count))
            FromToView(path: $path, fromString: $fromString, toString: $toString, isSearchButtonVisible: $isSearchButtonVisible)
            Spacer()
        }
        .onAppear {
            isSearchButtonVisible = fromString != (Localization.Schedule.FromToView.from, "") && toString != (Localization.Schedule.FromToView.to, "")
        }
    }
    
    private func printButton() {
        print("button")
    }
}

#Preview {
    struct PreviewStruct: View {
        @State var path: [String] = []
        var body: some View {
            ScheduleView(viewModel: StoriesViewModel(), path: $path, isSearchButtonVisible: false, fromString: ("From", ""), toString: ("To", ""))
        }
    }
    return PreviewStruct()
}