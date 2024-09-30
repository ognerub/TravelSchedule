//
//  ToogleCircleView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

struct ToogleCircleView: View {
    
    let label: String
    @Binding var isOn: Bool
    
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
        @State private var isOn: Bool = true
        var body: some View {
            ToogleCircleView(label: "Circle toogle", isOn: $isOn)
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
