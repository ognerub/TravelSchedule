//
//  SpecifyButton.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

struct SpecifyButtonView: View {
    var body: some View {
        Text(Localization.Schedule.SpecifyButtonView.filter)
            .foregroundColor(Color.init(UIColor.whiteDay))
            .font(Font.system(size: 17, weight: .bold))
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.init(UIColor.blueUniversal))
            .cornerRadius(16)
            .padding(.horizontal, 16)
    }
}

#Preview {
    SpecifyButtonView()
}
