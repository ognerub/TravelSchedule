//
//  SpecifyButton.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

struct InfinityWidthButtonView: View {
    
    @State var string: String
    @Binding var isRedDotVisible: Bool
    
    var body: some View {
        HStack {
            Text(string)
            Rectangle()
                .frame(width: 8, height: 8)
                .cornerRadius(8)
                .foregroundColor(Color.init(uiColor: UIColor.redUniversal))
                .opacity(isRedDotVisible ? 1 : 0)
        }
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
    struct InfinityWidthButtonPreviewContainer : View {
        @State private var isRedDotVisible = true
        var body: some View {
            InfinityWidthButtonView(string: Localization.Schedule.SpecifyButtonView.filter, isRedDotVisible: $isRedDotVisible)
        }
    }
    return InfinityWidthButtonPreviewContainer()
}
