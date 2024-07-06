//
//  CarrierCardView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI

struct CarrierCardView: View {
    
    @ObservedObject var viewModel = CarrierCardViewModel()
    let carrier: CarrierCardModel

    var body: some View {
        VStack(alignment: .leading) {
            CarrierLogoView(logoTurple: (URL(string: carrier.logo), carrier.logoType))
            CustomTextView(string: carrier.name, size: 24, weight: .bold, color: UIColor.blackDay)
                .frame(height: 60)
                .padding(.horizontal, 16)
            CarrierContactTextView(contactTitle: "E-mail", contactValue: carrier.email.count > 0 ? carrier.email : Localization.CarrierCardView.empty)
            CarrierContactTextView(contactTitle: "Phone", contactValue: carrier.phone.count > 0 ? carrier.phone : Localization.CarrierCardView.empty)
            Spacer()
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    CarrierCardView(carrier: CarrierCardModel(logo: "", logoType: .jpg, name: "", email: "", phone: ""))
}
