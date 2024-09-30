//
//  SettingsViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 19.07.2024.
//

import SwiftUI
import Network

@MainActor
final class SettingsViewModel: ObservableObject {
    
    @Binding var appearanceSelection: Int
    
    @Published var isConnected = true
    @Published var isProgressViewVisible: Bool = true
    
    init(appearanceSelection: Binding<Int>) {
        self._appearanceSelection = appearanceSelection
    }
    
    func checkInternetConnection() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self else { return }
            Task { @MainActor in
                self.isConnected = (path.status == .satisfied)
            }
        }
        let queue = DispatchQueue(label: "InternetMonitor")
        monitor.start(queue: queue)
    }
}
