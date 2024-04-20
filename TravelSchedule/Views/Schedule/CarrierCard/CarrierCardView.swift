//
//  CarrierCardView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI

struct CarrierCardView: View {
    
    @ObservedObject var viewModel = CarrierCardViewModel()
    @State var logo: String
    
    var body: some View {
        VStack(alignment: .leading) {
            CarrierLogoView(logo: viewModel.carriersCardsArray.filter { $0.logo == logo}.first?.logo ?? "")
            CustomTextView(string: viewModel.carriersCardsArray.filter { $0.logo == logo}.first?.name ?? "No info", size: 24, weight: .bold, color: UIColor.blackDay)
                .frame(height: 60)
                .padding(.horizontal, 16)
            CarrierContactTextView(contactTitle: "E-mail", contactValue: viewModel.carriersCardsArray.filter { $0.logo == logo}.first?.email ?? "")
            CarrierContactTextView(contactTitle: "Phone", contactValue: viewModel.carriersCardsArray.filter { $0.logo == logo}.first?.phone ?? "")
            Spacer()
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    CarrierCardView(logo: "url")
}
