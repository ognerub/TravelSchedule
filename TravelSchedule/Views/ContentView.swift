//
//  TabView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 07.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("appearanceSelection") var appearanceSelection: Int = 0
    
    @State private var selection = 0
    @State var navPath: [String] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            TabView(selection: $selection) {
                ScheduleView(path: $navPath)
                    .tabItem { Image(.scheduleTabIcon) }
                    .tag(0)
                SettingsView(appearanceSelection: $appearanceSelection)
            }
            .tint(Color.init(UIColor.blackDay))
        }
        .tint(Color.init(UIColor.blackDay))
    }
}

#Preview {
    ContentView()
}
