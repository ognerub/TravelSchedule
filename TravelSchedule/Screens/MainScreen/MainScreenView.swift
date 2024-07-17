//
//  TabView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 07.04.2024.
//

import SwiftUI

struct MainScreenView: View {

    @ObservedObject var viewModel: MainScreenViewModel
    @State var selection = 0

    var body: some View {
        NavigationStack(path: $viewModel.navPath) {
            ZStack {
                TabView(selection: $selection) {
                    ScheduleView(path: $viewModel.navPath)
                        .tabItem { Image(.scheduleTabIcon) }
                        .tag(0)
                    SettingsView(appearanceSelection: $viewModel.appearanceSelection)
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
        .onAppear {
            viewModel.getStations()
        }
        .sheet(isPresented: $viewModel.error, content: {
            NoNetworkView(action: {
                viewModel.error = false
                viewModel.getStations()
            }, errorType: .serverError)
        })
    }
}

#Preview {
    struct PreviewStruct: View {
        @AppStorage("appearanceSelection") private var appearanceSelection: Int = 0
        var body: some View {
            MainScreenView(viewModel: MainScreenViewModel(appearanceSelection: $appearanceSelection), selection: 0)
        }
    }
    return PreviewStruct()
}

