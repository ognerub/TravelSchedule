//
//  SearchButtonView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

struct SearchButtonView: View {
    
    var body: some View {
        Text(Localization.Schedule.SearchButtonView.search)
            .foregroundColor(Color.init(UIColor.whiteUniversal))
            .font(Font.system(size: 17, weight: .bold))
            .frame(width: 150, height: 60)
            .background(Color.init(UIColor.blueUniversal))
            .cornerRadius(16)
    }
}

#Preview {
    SearchButtonView()
}
