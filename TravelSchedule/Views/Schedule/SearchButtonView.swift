//
//  SearchButtonView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 10.04.2024.
//

import SwiftUI

struct SearchButtonView: View {
    var body: some View {
        Button(action: printButton) {
            Text("Search")
                .foregroundColor(Color.init(UIColor.whiteDay))
                .font(Font.system(size: 17, weight: .bold))
        }
        .frame(width: 150, height: 60)
        .background(Color.init(UIColor.blueUniversal))
        .cornerRadius(16)
    }
    
    private func printButton() {
        print("print")
    }
}

#Preview {
    SearchButtonView()
}
