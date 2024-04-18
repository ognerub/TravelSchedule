//
//  CarrierLogoView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

struct CarrierLogoView: View {
    
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

#Preview {
    CarrierLogoView(logo: "url")
}
