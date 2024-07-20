//
//  CarrierCardView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI

struct CarrierCardView: View {

    @ObservedObject var viewModel: CarrierCardViewModel

    var body: some View {
        VStack(alignment: .leading) {
            CarrierLogoView(logoTurple: (URL(string: viewModel.carrier.logo), viewModel.carrier.logoType))
            CustomTextView(string: viewModel.carrier.name, size: 24, weight: .bold, color: UIColor.blackDay)
                .frame(height: 60)
                .padding(.horizontal, 16)
            CarrierContactTextView(contactTitle: "E-mail", contactValue: viewModel.carrier.email.count > 0 ? viewModel.carrier.email : Localization.CarrierCardView.empty)
            CarrierContactTextView(contactTitle: "Phone", contactValue: viewModel.carrier.phone.count > 0 ? viewModel.carrier.phone : Localization.CarrierCardView.empty)
            Spacer()
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    CarrierCardView(viewModel: CarrierCardViewModel(carrier: CarrierCardModel(logo: "", logoType: .jpg, name: "", email: "", phone: "")))
}
