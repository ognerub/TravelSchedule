//
//  SpecifyTimeView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

struct SpecifyTimeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var isMorningFilterOn: Bool
    @Binding var isAfternoonFilterOn: Bool
    @Binding var isEveningFilterOn: Bool
    @Binding var isNightFilterOn: Bool
    @Binding var isTransfersFilterOn: Bool
    
    var body: some View {
        ZStack {
            LazyVStack(alignment: .leading, spacing: 0, content: {
                Section(content: {
                    ToogleCheckBoxView(label: Localization.Schedule.SpecifyTimeView.morning + " 06:00 - 12:00", isOn: $isMorningFilterOn)
                    ToogleCheckBoxView(label: Localization.Schedule.SpecifyTimeView.afternoon + " 12:00 - 18:00", isOn: $isAfternoonFilterOn)
                    ToogleCheckBoxView(label: Localization.Schedule.SpecifyTimeView.evening + " 18:00 - 00:00", isOn: $isEveningFilterOn)
                    ToogleCheckBoxView(label: Localization.Schedule.SpecifyTimeView.night  + " 00:00 - 06:00", isOn: $isNightFilterOn)
                }, header: {
                    CustomTextView(string: Localization.Schedule.SpecifyTimeView.departureTime, size: 24, weight: .bold, color: UIColor.blackDay)
                })
                .frame(height: 60)
                Section(content: {
                    ToogleCircleView(label: Localization.Schedule.SpecifyTimeView.yes, isOn: $isTransfersFilterOn)
                    ToogleCircleView(label: Localization.Schedule.SpecifyTimeView.no, isOn: !$isTransfersFilterOn)
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
                InfinityWidthButtonView(string: Localization.Schedule.SpecifyTimeView.apply,
                                        isRedDotVisible: Binding(projectedValue: .constant(false)))
            })
        }
    }
    
    private func dismissView() {
        dismiss()
    }
}
#Preview {
    struct  SpecifyTimePreviewContainer : View {
        @State private var isMorningFilterOn = false
        @State private var isAfternoonFilterOn = false
        @State private var isEveningFilterOn = false
        @State private var isNightFilterOn = false
        @State private var isTransfersFilterOn = false
        @State private var isRedDotVisible = false
        var body: some View {
            SpecifyTimeView(
                isMorningFilterOn: $isMorningFilterOn,
                isAfternoonFilterOn: $isAfternoonFilterOn,
                isEveningFilterOn: $isEveningFilterOn,
                isNightFilterOn: $isNightFilterOn,
                isTransfersFilterOn: $isTransfersFilterOn
            )
        }
    }
    return  SpecifyTimePreviewContainer()
}

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}
