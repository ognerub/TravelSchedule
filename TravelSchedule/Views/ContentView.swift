//
//  TabView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 07.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            ScheduleView()
                .tabItem { Image(.scheduleTabIcon) }
                .tag(0)
            Text("Settings")
                .tabItem { Image(.settingsTabIcon) }
                .tag(1)
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
