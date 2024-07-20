//
//  CarrierLogoView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

struct CarrierLogoView: View {

    let logoTurple: (URL?, LogoImageType)
    
    var body: some View {
        HStack {
            Spacer()
            if logoTurple.1.rawValue == LogoImageType.svg.rawValue {
                SVGAsyncImage(url: logoTurple.0)
                    .frame(height: 104)
            } else {
                AsyncImageView(urlString: logoTurple.0?.absoluteString)
                    .frame(height: 104)
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(24, corners: .allCorners)
        .padding(.horizontal, 16)
    }
}

#Preview {
    CarrierLogoView(logoTurple:( URL(string: ""), .jpg))
}
