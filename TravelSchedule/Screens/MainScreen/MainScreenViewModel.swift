//
//  MainScreenViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 06.07.2024.
//

import SwiftUI
import RealmSwift

@MainActor
final class MainScreenViewModel: ObservableObject {

    var realmStorageService: RealmStorageProtocol

    @Published var navPath: [String] = []
    @Published var isLoading: Bool = false

    @Binding var appearanceSelection: Int

    var сountries = [RealmCountry]()

    private let networkService = NetworkService()

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
        print("Get stations")
        if сountries.isEmpty {
            Task {
                do {
                    print("Create network service")
                    guard let service = await networkService.createStationsListService() else { return }
                    print("Show loading process and block user UI")
                    isStations(loaded: false)
                    print("CHECK IS REALM EMPTY")
                    let isRealmEmpty = await realmStorageService.checkIsRealmEmpty()
                    print("REALM IS \(isRealmEmpty ? "EMPTY" : "NOT EMPTY!")")
                    if isRealmEmpty {
                        print("Create task")
                        let response = try await service.getListOfAllStations()
                        print("Got response")
                        var responseCountries: [Countries] = response.countries ?? []
                        let targetCountyName = "Россия"
                        if let targetIndex = responseCountries.firstIndex(where: { $0.title == targetCountyName }) {
                            let targetCounty = responseCountries.remove(at: targetIndex)
                            responseCountries.insert(targetCounty, at: 0)
                        }
                        print("Assign response to current countries array")
                        print("Write to Realm begins")
                        await realmStorageService.tryRealmWrite(responseCountries: responseCountries)
                        print("Write to Realm over")
                    }
                    сountries = realmStorageService.сountries
                    isStations(loaded: true)
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                    isStations(loaded: true)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    isStations(loaded: true)
                } catch let DecodingError.valueNotFound(value, context) {
                    isLoading = false
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    isStations(loaded: true)
                } catch let DecodingError.typeMismatch(type, context)  {
                    isLoading = false
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    isStations(loaded: true)
                } catch {
                    isLoading = false
                    print("❌ ERROR: \(error.localizedDescription)")
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
