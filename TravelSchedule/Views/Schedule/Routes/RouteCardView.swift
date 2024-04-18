//
//  RouteCardView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

struct RouteCardView: View {
    
    @State var route: RouteModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(uiImage: (UIImage(named: route.logo) ?? UIImage(systemName: "nosign")!))
                VStack(alignment: .leading) {
                    CustomTextView(string: route.company, size: 17, weight: .regular, color: UIColor.blackUniversal)
                    CustomTextView(string: route.transfer, size: 12, weight: .regular, color: UIColor.redUniversal)
                }
                Spacer()
                CustomTextView(string: route.date, size: 14, weight: .regular, color: UIColor.blackUniversal)
            }
            HStack {
                CustomTextView(string: route.startTime, size: 17, weight: .regular, color: UIColor.blackUniversal)
                Rectangle()
                    .foregroundColor(Color.init(uiColor: UIColor.greyUniversal))
                    .frame(height: 1)
                CustomTextView(string: route.duration, size: 12, weight: .regular, color: UIColor.blackUniversal)
                    .frame(minWidth: 56)
                    .lineLimit(1)
                Rectangle()
                    .foregroundColor(Color.init(uiColor: UIColor.greyUniversal))
                    .frame(height: 1)
                CustomTextView(string: route.endTime, size: 17, weight: .regular, color: UIColor.blackUniversal)
            }
        }
        .padding(14)
        .background(Color.init(uiColor: UIColor.lightGrey))
        .cornerRadius(24, corners: .allCorners)
    }
}

#Preview {
    RouteCardView(route: RouteModel(id: UUID(), logo: "rzhd", company: "Russian Railways", transfer: "With a transfer in Kostroma", date: "14 january", startTime: "22:30", endTime: "08:15", duration: "20 hours"))
}
