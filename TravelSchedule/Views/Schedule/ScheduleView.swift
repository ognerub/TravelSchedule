//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import SwiftUI

struct ScheduleView: View {
    
    @StateObject var viewModel = ScheduleViewModel()
    @State private var fromString: String = ""
    @State private var toString: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                StoriesView()
                FromToView(fromString: fromString, toString: toString)
                SearchButtonView()
                Spacer()
            }
        }
    }
    
    private func printButton() {
        print("button")
    }
}

#Preview {
    ScheduleView()
}
