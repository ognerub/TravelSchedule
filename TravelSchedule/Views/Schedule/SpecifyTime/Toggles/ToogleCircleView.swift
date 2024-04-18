//
//  ToogleCircleView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

struct ToogleCircleView: View {
    
    @Binding var isOn: Bool
    @State var label: String
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(label)
                .font(Font.system(size: 17, weight: .regular))
                .foregroundColor(Color.init(uiColor: UIColor.blackDay))
        }
        .toggleStyle(ToggleCircleStyle())
    }
}

#Preview {
    struct ToogleCirclePreviewContainer : View {
        @State private var value = false
        var body: some View {
            ToogleCircleView(isOn: $value, label: "Circle toogle")
        }
    }
    return ToogleCirclePreviewContainer()
}

struct ToggleCircleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                configuration.label
                Spacer()
                Image(systemName: configuration.isOn ? "smallcircle.filled.circle" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .tint(Color.init(uiColor: UIColor.blackDay))
            }
        })
    }
}
