//
//  ToogleCheckBoxView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

struct ToogleCheckBoxView: View {
    
    @Binding var isOn: Bool
    @State var label: String
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(label)
                .font(Font.system(size: 17, weight: .regular))
                .foregroundColor(Color.init(uiColor: UIColor.blackDay))
        }
        .toggleStyle(ToggleCheckboxStyle())
    }
}

#Preview {
    struct ToogleCheckBoxPreviewContainer : View {
        @State private var value = false
        var body: some View {
            ToogleCheckBoxView(isOn: $value, label: "Afternoon")
        }
    }
    return ToogleCheckBoxPreviewContainer()
}

struct ToggleCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                configuration.label
                Spacer()
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .tint(Color.init(uiColor: UIColor.blackDay))
            }
        })
    }
}
