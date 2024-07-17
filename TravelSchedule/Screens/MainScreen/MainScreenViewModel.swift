//
//  MainScreenViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 06.07.2024.
//

import SwiftUI
import RealmSwift
import Combine

@MainActor
final class MainScreenViewModel: ObservableObject {

    var realmStorageService: RealmStorageProtocol

    @Binding var appearanceSelection: Int

    @Published var navPath: [String] = []
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var сountries = [RealmCountry]()

    private let networkService = NetworkService()
    private var cancellables = Set<AnyCancellable>()
    private var window: UIWindow? {
        let allScenes = UIApplication.shared.connectedScenes
        for scene in allScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows where window.isKeyWindow {
                return window
            }
        }
        return nil
    }

    init(appearanceSelection: Binding<Int>) {
        self._appearanceSelection = appearanceSelection
        self.realmStorageService = RealmStorageService()
    }

    func getStations() {
        if сountries.isEmpty {
            Task {
                guard let service = await networkService.createStationsListService() else { return }
                isStations(loaded: false)
                let isRealmEmpty = realmStorageService.checkIsRealmEmpty()
                if isRealmEmpty {
                    var responseCountries = [Countries]()
                    service.getListOfAllStationsCombine()
                        .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { [weak self] completion in
                            switch completion {
                            case .failure(let error):
                                self?.error = error.localizedDescription
                            case .finished:
                                break
                            }
                        }, receiveValue: { [weak self] stationsList in
                            guard let self else { return }
                            responseCountries = stationsList.countries ?? []
                            self.realmStorageService.tryRealmWrite(responseCountries: responseCountries)
                            self.сountries = self.realmStorageService.сountries
                            self.isStations(loaded: true)
                        })
                        .store(in: &cancellables)
                } else {
                    сountries = realmStorageService.сountries
                    isStations(loaded: true)
                }
            }
        }
    }

    private func isStations(loaded: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.isLoading = !loaded
            self.window?.isUserInteractionEnabled = loaded
        }
    }
}
