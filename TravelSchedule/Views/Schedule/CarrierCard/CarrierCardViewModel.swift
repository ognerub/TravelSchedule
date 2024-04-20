//
//  CarrierCardViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI

struct CarrierCardModel: Hashable {
    let logo: String
    let name: String
    let email: String
    let phone: String
}

class CarrierCardViewModel: ObservableObject {
    @Published var carriersCardsArray: [CarrierCardModel] = [
        CarrierCardModel(logo: "rzhd", name: "Russian Railways", email: "ticket@rzd.ru", phone: "8 (800) 775-00-00"),
        CarrierCardModel(logo: "fgk", name: "Federal freight company", email: "info@railfgk.ru", phone: "8 800 250-4777"),
        CarrierCardModel(logo: "url", name: "Ural Logistic Group", email: "contact@ural-lg.ru", phone: "8 (800) 505-49-61")
    ]
}
