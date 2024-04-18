//
//  SpecifyButton.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

struct InfinityWidthButtonView: View {
    
    @State var string: String
    
    var body: some View {
        Text(string)
            .foregroundColor(Color.init(UIColor.whiteUniversal))
            .font(Font.system(size: 17, weight: .bold))
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.init(UIColor.blueUniversal))
            .cornerRadius(16)
            .padding(.horizontal, 16)
    }
}

#Preview {
    InfinityWidthButtonView(string: Localization.Schedule.SpecifyButtonView.filter)
}
