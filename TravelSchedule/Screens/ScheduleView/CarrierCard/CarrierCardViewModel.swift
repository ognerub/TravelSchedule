//
//  CarrierCardViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI

struct CarrierCardModel: Hashable {
    let logo: String
    let logoType: LogoImageType
    let name: String
    let email: String
    let phone: String
}

@MainActor
final class CarrierCardViewModel: Sendable, ObservableObject {
    let carrier: CarrierCardModel

    init(carrier: CarrierCardModel) {
        self.carrier = carrier
    }
}
