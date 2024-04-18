//
//  CustomTextView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

struct CustomTextView: View {
    
    @State var string: String
    @State var size: CGFloat
    @State var weight: Font.Weight
    @State var color: UIColor
    
    var body: some View {
        Text(string)
            .font(Font.system(size: size, weight: weight))
            .foregroundColor(Color(uiColor: color))
    }
}

#Preview {
    CustomTextView(string: "Custom text view", size: 17, weight: .bold, color: UIColor.redUniversal)
}
