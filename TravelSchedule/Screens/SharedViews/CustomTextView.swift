//
//  CustomTextView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

struct CustomTextView: View {
    
    var string: String
    var size: CGFloat
    var weight: Font.Weight
    var color: UIColor

    var body: some View {
        Text(string)
            .font(Font.system(size: size, weight: weight))
            .foregroundColor(Color(uiColor: color))
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    CustomTextView(string: "Custom text view", size: 17, weight: .bold, color: UIColor.redUniversal)
}
