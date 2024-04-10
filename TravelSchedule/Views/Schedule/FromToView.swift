//
//  FromToView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 10.04.2024.
//

import SwiftUI

struct FromToView: View {
    
    @State var fromString: String
    @State var toString: String
    
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                TextField(
                    fromString,
                    text: $fromString,
                    prompt: Text(Localization.Schedule.FromToView.from).foregroundColor(Color.init(UIColor.greyUniversal))
                )
                .padding([.leading, .trailing], 16)
                .frame(height: 48)
                .background(Color.init(UIColor.white))
                .cornerRadius(16, corners: [.topLeft, .topRight])
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                TextField(
                    toString,
                    text: $toString,
                    prompt: Text(Localization.Schedule.FromToView.to).foregroundColor(Color.init(UIColor.greyUniversal))
                )
                .padding([.leading, .trailing], 16)
                .frame(height: 48)
                .background(Color.init(UIColor.white))
                .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 0))
            }
            Button(action: switchButtonPressed) {
                Image(uiImage: UIImage.сhange)
                    .frame(width: 36, height: 36)
                    .padding(16)
            }
        }
        .background(Color.init(UIColor.blueUniversal))
        .cornerRadius(16)
        .padding(16)
    }
    
    private func switchButtonPressed() {
        print("switch")
    }
}

#Preview {
    FromToView(fromString: "From", toString: "To")
}
