//
//  SpecifyTimeView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

struct SpecifyTimeView: View {
    
    @State private var isMorningFilterOn = false
    @State private var isAfternoonFilterOn = false
    @State private var isEveningFilterOn = false
    @State private var isNightFilterOn = false
    @State private var isTransfersFilterOn = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            LazyVStack(alignment: .leading, spacing: 0, content: {
                Section(content: {
                    ToogleCheckBoxView(isOn: $isMorningFilterOn,
                                       label: Localization.Schedule.SpecifyTimeView.morning + " 06:00 - 12:00")
                    ToogleCheckBoxView(isOn: $isAfternoonFilterOn,
                                       label: Localization.Schedule.SpecifyTimeView.afternoon + " 12:00 - 18:00")
                    ToogleCheckBoxView(isOn: $isEveningFilterOn,
                                       label: Localization.Schedule.SpecifyTimeView.evening + " 18:00 - 00:00")
                    ToogleCheckBoxView(isOn: $isNightFilterOn,
                                       label: Localization.Schedule.SpecifyTimeView.night  + " 00:00 - 06:00")
                }, header: {
                    CustomTextView(string: Localization.Schedule.SpecifyTimeView.departureTime, size: 24, weight: .bold, color: UIColor.blackDay)
                })
                .frame(height: 60)
                Section(content: {
                    ToogleCircleView(isOn: !$isTransfersFilterOn, label: Localization.Schedule.SpecifyTimeView.yes)
                    ToogleCircleView(isOn: $isTransfersFilterOn, label: Localization.Schedule.SpecifyTimeView.no)
                }, header: {
                    CustomTextView(string: Localization.Schedule.SpecifyTimeView.showTransfers, size: 24, weight: .bold, color: UIColor.blackDay)
                })
                .frame(height: 60)
            })
            .padding(.horizontal, 16)
        }
        VStack {
            Spacer()
            Button(action: dismissView, label: {
                InfinityWidthButtonView(string: Localization.Schedule.SpecifyTimeView.apply)
            })
        }
    }
    
    private func dismissView() {
        dismiss()
    }
}

#Preview {
    SpecifyTimeView()
}

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}

struct ToogleCheckBoxView: View {
    
    @Binding var isOn: Bool
    @State var label: String
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(label)
                .font(Font.system(size: 17, weight: .regular))
                .foregroundColor(Color.init(uiColor: UIColor.blackDay))
        }
        .toggleStyle(CheckboxToggleStyle())
    }
}

struct CheckboxToggleStyle: ToggleStyle {
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

struct ToogleCircleView: View {
    
    @Binding var isOn: Bool
    @State var label: String
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(label)
                .font(Font.system(size: 17, weight: .regular))
                .foregroundColor(Color.init(uiColor: UIColor.blackDay))
        }
        .toggleStyle(CircleToggleStyle())
    }
}

struct CircleToggleStyle: ToggleStyle {
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
