//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import SwiftUI

struct ScheduleView: View {

    let networkService: NetworkServiceProtocol

    @Binding var path: [String]
    @State private var fromString: (String, String) = (Localization.Schedule.FromToView.from, "")
    @State private var toString: (String, String) = (Localization.Schedule.FromToView.to, "")
    @State private var isSearchButtonVisible: Bool = false

    var body: some View {
        VStack {
            StoriesView()
            FromToView(
                networkService: networkService,
                path: $path,
                fromString: $fromString,
                toString: $toString,
                isSearchButtonVisible: $isSearchButtonVisible
            )
            Spacer()
        }
        .onAppear {
            isSearchButtonVisible = fromString !=
            (Localization.Schedule.FromToView.from, "") &&
            toString != (Localization.Schedule.FromToView.to, "")
        }
    }
}

#Preview {
    struct PreviewStruct: View {
        let networkService: NetworkServiceProtocol = NetworkService()
        @State private var path: [String] = []
        var body: some View {
            ScheduleView(networkService: networkService, path: $path)
        }
    }
    return PreviewStruct()
}
