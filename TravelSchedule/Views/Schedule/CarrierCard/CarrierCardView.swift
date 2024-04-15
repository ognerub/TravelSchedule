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
            ExtractedView(logo: viewModel.carriersCardsArray.filter { $0.logo == logo}.first?.logo ?? "")
            CustomTextView(string: viewModel.carriersCardsArray.filter { $0.logo == logo}.first?.name ?? "No info", size: 24, weight: .bold, color: UIColor.blackDay)
                .frame(height: 60)
                .padding(.horizontal, 16)
            ContactTextView(contactTitle: "E-mail", contactValue: viewModel.carriersCardsArray.filter { $0.logo == logo}.first?.email ?? "")
            ContactTextView(contactTitle: "Phone", contactValue: viewModel.carriersCardsArray.filter { $0.logo == logo}.first?.phone ?? "")
            Spacer()
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    CarrierCardView(logo: "url")
}

struct ExtractedView: View {
    
    @State var logo: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(uiImage: (UIImage(named: logo) ?? UIImage(systemName: "nosign")!))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 104)
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(24, corners: .allCorners)
        .padding(.horizontal, 16)
    }
}

struct ContactTextView: View {
    
    @State var contactTitle: String
    @State var contactValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomTextView(string: contactTitle, size: 17, weight: .regular, color: UIColor.blackDay)
            CustomTextView(string: contactValue, size: 12, weight: .regular, color: UIColor.blueUniversal)
        }
        .frame(height: 60)
        .padding(.horizontal, 16)
    }
}
