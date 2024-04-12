//
//  FromToView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 10.04.2024.
//

import SwiftUI

struct FromToView: View {
    
    @State var fromString: String = "From"
    @State var toString: String = "To"
    @State var isStringsSwitched: Bool = false
    
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                NavigationLink(value: isStringsSwitched ? "BottomTextFieldView" : "TopTextFieldView", label: {
                    TextFieldView(string: isStringsSwitched ? $toString : $fromString, type: .top)
                })
                .buttonStyle(TransparentButtonStyle())
                NavigationLink(value: isStringsSwitched ? "TopTextFieldView" : "BottomTextFieldView", label: {
                    TextFieldView(string: isStringsSwitched ? $fromString : $toString, type: .bottom)
                })
                .buttonStyle(TransparentButtonStyle())
                .navigationDestination(for: String.self) { id in
                    if id == "TopTextFieldView" {
                        Text("Это детальное представление 1")
                    }
                    if id == "BottomTextFieldView" {
                        Text("Это детальное представление 2")
                    }
                }
            }
            Button(action: {
                isStringsSwitched.toggle()
            }) {
                Image(uiImage: UIImage.сhange)
                    .frame(width: 36, height: 36)
                    .padding(16)
            }
        }
        .background(Color.init(UIColor.blueUniversal))
        .cornerRadius(16)
        .padding(16)
    }
}

#Preview {
    FromToView(fromString: "From", toString: "To")
}

struct TransparentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color.init(UIColor.clear) : Color.init(UIColor.clear))
    }
}


struct TextFieldView: View {
    
    enum TextFieldType {
        case top
        case bottom
    }
    
    @Binding var string: String
    let type: TextFieldType
    
    var body: some View {
            TextField(
                string,
                text: $string,
                prompt:
                    type == .top ? Text(Localization.Schedule.FromToView.from).foregroundColor(Color.init(UIColor.greyUniversal)) : Text(Localization.Schedule.FromToView.to).foregroundColor(Color.init(UIColor.greyUniversal))
            )
            .multilineTextAlignment(.leading)
            .padding([.leading, .trailing], 16)
            .frame(height:48, alignment: .leading)
            .background(Color.init(UIColor.white))
            .cornerRadius(16, corners: type == .top ? [.topLeft, .topRight] : [.bottomLeft, .bottomRight])
            .padding(EdgeInsets(top: type == .top ? 16 : 0, leading: 16, bottom: type == .top ? 0 : 16, trailing: 0))
            .disabled(true)
    }
}
