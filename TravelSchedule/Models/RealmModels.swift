//
//  RealmModels.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 20.07.2024.
//

import Foundation
import RealmSwift

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

