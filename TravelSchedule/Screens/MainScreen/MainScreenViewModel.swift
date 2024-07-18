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
final class MainScreenViewModel: Sendable, ObservableObject {

    let networkService: NetworkServiceProtocol = NetworkService()
    var realmStorageService = RealmStorageService()

    @ObservedResults(RealmCountry.self) var realmCountriesList
    
    @Published var navPath: [String] = []
    @Published var isLoading: Bool = false
    @Published var error: Bool = false
    @Published var сountries = [RealmCountry]()
    @Published var printOutput: String = Localization.Schedule.loading

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

    func getStationsTask() async {
        do {
            try await getStations()
        } catch {
            self.error = true
        }
    }

    func getStations() async throws {
        if сountries.isEmpty {
            guard let service = await networkService.createStationsListService() else { return }
            isStations(loaded: false)
            async let isRealmEmpty = realmStorageService.checkIsRealmEmpty()
            if await isRealmEmpty {
                var responseCountries = [Countries]()
                do {
                    let stationsList = try await service.getListOfAllStations()
                    responseCountries = stationsList.countries ?? []
                    await self.realmStorageService.tryRealmWrite(responseCountries: responseCountries)
                    print("write to Realm over")
                    self.сountries = self.realmCountriesList.map { $0 }
                    self.isStations(loaded: true)
                } catch {
                    print(error.localizedDescription)
                    self.isStations(loaded: true)
                }
            } else {
                сountries = self.realmCountriesList.map { $0 }
                isStations(loaded: true)
            }
        }
    }

    private func isStations(loaded: Bool) {
        self.isLoading = !loaded
        self.window?.isUserInteractionEnabled = loaded
    }
}
