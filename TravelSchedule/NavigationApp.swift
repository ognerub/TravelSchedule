//
//  NavigationApp.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 07.04.2024.
//

import SwiftUI

@main
struct NavigationApp: App {

    @AppStorage("appearanceSelection") private var appearanceSelection: Int = 0

    var appearanceSwitch: ColorScheme? {
        if appearanceSelection == 1 {
            return .light
        }
        else if appearanceSelection == 2 {
            return .dark
        }
        else {
            return .none
        }
    }

    var body: some Scene {
        WindowGroup {
            MainScreenView(viewModel: MainScreenViewModel(appearanceSelection: $appearanceSelection))
                .preferredColorScheme(appearanceSwitch)
        }
    }
}
