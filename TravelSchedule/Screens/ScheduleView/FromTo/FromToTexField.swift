//
//  FromToTexFieldView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

enum TextFieldType {
    case top
    case bottom
}

struct TextFieldView: View {

    let type: TextFieldType

    @Binding var string: String

    var body: some View {
        TextField(
            string,
            text: $string
        )
        .multilineTextAlignment(.leading)
        .padding([.leading, .trailing], 16)
        .frame(height:48, alignment: .leading)
        .foregroundColor(Color.init((string == Localization.Schedule.FromToView.from || string == Localization.Schedule.FromToView.to) ? UIColor.greyUniversal : UIColor.blackUniversal))
        .background(Color.init(UIColor.white))
        .cornerRadius(16, corners: type == .top ? [.topLeft, .topRight] : [.bottomLeft, .bottomRight])
        .padding(EdgeInsets(top: type == .top ? 16 : 0, leading: 16, bottom: type == .top ? 0 : 16, trailing: 0))
        .disabled(true)
    }
}

#Preview {
    struct PreviewStruct: View {
        @State private var string = "Test string"
        var body: some View {
            TextFieldView(type: .top, string: $string)
        }
    }
    return ZStack {
        Color(.purple)
        PreviewStruct()
    }
}
