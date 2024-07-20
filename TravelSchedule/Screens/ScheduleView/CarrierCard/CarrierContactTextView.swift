//
//  CarrierContactTextView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

struct CarrierContactTextView: View {

    let contactTitle: String
    let contactValue: String

    var body: some View {
        VStack(alignment: .leading) {
            CustomTextView(string: contactTitle, size: 17, weight: .regular, color: UIColor.blackDay)
            CustomTextView(string: contactValue, size: 12, weight: .regular, color: UIColor.blueUniversal)
        }
        .frame(height: 60)
        .padding(.horizontal, 16)
    }
}

#Preview {
    CarrierContactTextView(contactTitle: "E-mail", contactValue: "info@rzhd.com")
}
