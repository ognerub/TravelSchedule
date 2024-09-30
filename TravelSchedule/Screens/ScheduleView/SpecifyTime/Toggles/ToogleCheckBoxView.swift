//
//  ToogleCheckBoxView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

struct ToogleCheckBoxView: View {
    
    let label: String
    @Binding var isOn: Bool
    
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
        @State private var isOn: Bool = true
        var body: some View {
            ToogleCheckBoxView(label: "Afternoon", isOn: $isOn)
        }
    }
    return ToogleCheckBoxPreviewContainer()
}

struct ToggleCheckboxStyle: ToggleStyle {
    
    var action: ()
    
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
