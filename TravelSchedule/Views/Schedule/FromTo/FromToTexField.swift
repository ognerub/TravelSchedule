//
//  FromToTexFieldView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 18.04.2024.
//

import SwiftUI

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
    TextFieldView(string: FromToView(path: ScheduleView(path: ContentView().$navPath).$path, fromString: ScheduleView(path: ContentView().$navPath).$fromString, toString: ScheduleView(path: ContentView().$navPath).$toString, isSearchButtonVisible: ScheduleView(path: ContentView().$navPath).$isSearchButtonVisible).$fromString, type: .top)
}
