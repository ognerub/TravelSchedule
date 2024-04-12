//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import SwiftUI

struct ScheduleView: View {
    
    @StateObject var viewModel = ScheduleViewModel()
    @State var isSearchButtonVisible: Bool = false
    
    var body: some View {
        VStack {
            StoriesView()
            FromToView()
            SearchButtonView()
                .opacity(isSearchButtonVisible ? 1 : 0)
            Spacer()
        }
    }
    
    private func printButton() {
        print("button")
    }
}

#Preview {
    ScheduleView()
}
