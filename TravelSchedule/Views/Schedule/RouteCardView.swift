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
                    Text(route.company)
                        .font(Font.system(size: 17, weight: .regular))
                    Text(route.transfer)
                        .font(Font.system(size: 12, weight: .regular))
                        .foregroundColor(Color(uiColor: UIColor.redUniversal))
                }
                Spacer()
                Text(route.date)
                    .font(Font.system(size: 14, weight: .regular))
            }
            HStack {
                Text(route.startTime)
                    .font(Font.system(size: 17, weight: .regular))
                Rectangle()
                    .foregroundColor(Color.init(uiColor: UIColor.greyUniversal))
                    .frame(width: .infinity, height: 1)
                Text(route.duration)
                    .font(Font.system(size: 12, weight: .regular))
                    .frame(minWidth: 56)
                    .lineLimit(1)
                Rectangle()
                    .foregroundColor(Color.init(uiColor: UIColor.greyUniversal))
                    .frame(width: .infinity, height: 1)
                Text(route.endTime)
                    .font(Font.system(size: 17, weight: .regular))
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
