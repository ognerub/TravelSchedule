//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 07.04.2024.
//

import SwiftUI

struct MainScreenView: View {

    @StateObject private var viewModel = MainScreenViewModel()
    @AppStorage("appearanceSelection") private var appearanceSelection: Int = 0
    @State private var selection: Int = 0

    var body: some View {
        NavigationStack(path: $viewModel.navPath) {
            ZStack {
                TabView(selection: $selection) {
                    ScheduleView(networkService: viewModel.networkService, path: $viewModel.navPath)
                        .tabItem { Image(.scheduleTabIcon) }
                        .tag(0)
                    SettingsScreenView(viewModel: SettingsViewModel(appearanceSelection: $appearanceSelection))
                        .tabItem { Image(.settingsTabIcon) }
                        .tag(1)
                }
                .tint(Color.init(UIColor.blackDay))
                VStack {
                    ProgressView()
                    Text(viewModel.printOutput)
                }
                .opacity(viewModel.isLoading ? 1 : 0)
            }
            .tint(Color.init(UIColor.blackDay))
        }
        .task {
            await viewModel.getStationsTask()
        }
        .sheet(isPresented: $viewModel.error, content: {
            NoNetworkView(action: {
                viewModel.error = false
            }, errorType: .serverError)
        })
        .preferredColorScheme(preferredColor(appearanceSelection: appearanceSelection))
    }

    private func preferredColor(appearanceSelection: Int) -> ColorScheme? {
        var appearanceSwitch: ColorScheme? {
            switch appearanceSelection {
            case 1:
                return .light
            case 2:
                return .dark
            default:
                return .none
            }
        }
        return appearanceSwitch
    }
}

#Preview {
    MainScreenView()
}

