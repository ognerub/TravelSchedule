//
//  RealmStorageService.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 11.07.2024.
//

import SwiftUI
import RealmSwift

@MainActor
final class RealmStorageService: Sendable {
    @ObservedResults(RealmCountry.self) var realmCountriesList
    
    func checkIsRealmEmpty() async -> Bool {
        var isRealmEmpty = true
        do {
            print("check Realm")
            let realm = try await Realm()
            print("get Realm countries")
            let realmCountries = realm.objects(RealmCountry.self)
            if realmCountries.count > 0 {
                print("Realm has \(realmCountries.count) countries")
                isRealmEmpty = false
            }
        } catch {
            print("Realm read error: \(error)")
        }
        return isRealmEmpty
    }
    
    func tryRealmWrite(responseCountries: [Countries]) async {
        do {
            let realm = try await Realm()
            try realm.write {
                // COUNTRIES
                print("start write to Realm")
                responseCountries.enumerated().forEach { (index, country) in
                    let realmCountry = RealmCountry()
                    realmCountry.title = country.title ?? ""
                    if let codes = country.codes {
                        let realmCountryCodes = RealmCountryCodes()
                        realmCountryCodes.yandex_code = codes.yandex_code
                        realmCountry.codes = realmCountryCodes
                    }
                    // REGIONS
                    (country.regions ?? []).forEach { region in
                        let realmRegion = RealmRegion()
                        realmRegion.title = region.title ?? ""
                        if let codes = region.codes {
                            let realmRegionCodes = RealmRegionCodes()
                            realmRegionCodes.yandex_code = codes.yandex_code
                            realmRegion.codes = realmRegionCodes
                        }
                        // SETTLEMENTS
                        (region.settlements ?? []).forEach { settlment in
                            let realmSettlment = RealmSettlement()
                            realmSettlment.title = settlment.title ?? ""
                            realmSettlment.stationsCount = settlment.stations?.count ?? 0
                            if let codes = settlment.codes {
                                let realmSettlmentCodes = RealmSettlementCodes()
                                realmSettlmentCodes.yandex_code = codes.yandex_code
                                realmSettlment.codes = realmSettlmentCodes
                            }
                            // STATIONS
                            (settlment.stations ?? []).forEach { station in
                                let realmStation = RealmStation()
                                realmStation.title = station.title ?? ""
                                if let latitudePayload = station.latitude {
                                    realmStation.latitude = latitudePayload.doubleValue ?? 0.0
                                }
                                if let longitudePayload = station.longitude {
                                    realmStation.longitude = longitudePayload.doubleValue ?? 0.0
                                }
                                realmStation.transport_type = station.transport_type ?? ""
                                realmStation.station_type = station.station_type ?? ""
                                realmStation.direction = station.direction ?? ""
                                if let codes = station.codes {
                                    let realmStationCodes = RealmStationCodes()
                                    realmStationCodes.yandex_code = codes.yandex_code
                                    realmStationCodes.esr_code = codes.esr_code
                                    realmStation.codes = realmStationCodes
                                }
                                realmSettlment.stations.append(realmStation)
                            }
                            realmRegion.settlements.append(realmSettlment)
                        }
                        realmCountry.regions.append(realmRegion)
                    }
                    realm.add(realmCountry)
                }
            }
        } catch {
            print("Realm write error: \(error.localizedDescription)")
        }
    }
}
