//
//  RealmStorageService.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 11.07.2024.
//

import SwiftUI
import RealmSwift

protocol RealmStorageProtocol {
    var сountries: [RealmCountry] { get set }
    func checkIsRealmEmpty() -> Bool
    func tryRealmWrite(responseCountries: [Countries])
}

final class RealmStorageService: RealmStorageProtocol {

    var сountries = [RealmCountry]()
    @ObservedResults(RealmCountry.self) var realmCountriesList // Realm

    func checkIsRealmEmpty() -> Bool {
        var isRealmEmpty = true
        do {
            print("check Realm")
            let realm = try Realm()
            print("get Realm countries")
            let realmCountries = realm.objects(RealmCountry.self)
            if realmCountries.count > 0 {
                print("Realm has \(realmCountries.count) countries")
                isRealmEmpty = false
                print("Create Realm token and convert countries")
                self.сountries = realmCountries.map { $0 }
                print("Convert from Realm over")
            }
        } catch {
            print("Realm read error: \(error)")
        }
        return isRealmEmpty
    }

    func tryRealmWrite(responseCountries: [Countries]) {
        do {
            let realm = try Realm()
            try realm.write {
                // COUNTRIES
                PrintManager.shared.print("There is \(responseCountries.count) countries to write")
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
                    PrintManager.shared.print("\(index)/\(responseCountries.count) over")
                }
            }
        } catch {
            print("Realm write error: \(error.localizedDescription)")
        }
    }
}

class RealmStationCodes: EmbeddedObject {
    @Persisted var yandex_code: String?
    @Persisted var esr_code: String?
}

class RealmStation: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var longitude: Double = 0.0
    @Persisted var latitude: Double = 0.0
    @Persisted var transport_type: String
    @Persisted var station_type: String
    @Persisted var direction: String
    @Persisted var codes: RealmStationCodes?
}

class RealmSettlementCodes: EmbeddedObject {
    @Persisted var yandex_code: String?
}

class RealmSettlement: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var codes: RealmSettlementCodes?
    @Persisted var stations = RealmSwift.List<RealmStation>()
    @Persisted var stationsCount: Int = 0
}

class RealmRegionCodes: EmbeddedObject {
    @Persisted var yandex_code: String?
}

class RealmRegion: Object {
    @Persisted var title: String = ""
    @Persisted var codes: RealmRegionCodes?
    @Persisted var settlements = RealmSwift.List<RealmSettlement>()
}

class RealmCountryCodes: EmbeddedObject {
    @Persisted var yandex_code: String?
}

class RealmCountry: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var codes: RealmCountryCodes?
    @Persisted var regions = RealmSwift.List<RealmRegion>()
}
