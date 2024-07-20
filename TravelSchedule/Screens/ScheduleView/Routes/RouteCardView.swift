//
//  RouteCardView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI
import SVGKit

enum LogoImageType: String {
    case jpg = "jpg"
    case svg = "svg"
}

struct RouteCardView: View {

    let route: RouteModel
    let logoTurple: (URL?, LogoImageType)

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                if logoTurple.1.rawValue == LogoImageType.svg.rawValue {
                    SVGAsyncImage(url: logoTurple.0)
                        .frame(width: 38, height: 38)
                } else {
                    AsyncImageView(urlString: logoTurple.0?.absoluteString)
                        .frame(width: 38, height: 38)
                }
                VStack(alignment: .leading) {
                    CustomTextView(string: route.companyTitle, size: 17, weight: .regular, color: UIColor.blackUniversal)
                        .multilineTextAlignment(.leading)
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
    RouteCardView(
        route: RouteModel(
            id: UUID(),
            logo: ("https://yastat.net/s3/rasp/media/data/company/svg/R-30x30__opt.svg", LogoImageType.svg),
            transfer: "With a transfer in Kostroma",
            date: "14 january",
            startTime: "22:30",
            endTime: "08:15",
            duration: "20 hours",
            companyTitle: "Центральная пригородная пассажирская компания",
            companyPhone: "Phone",
            companyEmail: "Email"
        ),
        logoTurple: (
            URL(
                string: "https://yastat.net/s3/rasp/media/data/company/svg/R-30x30__opt.svg"
            ),
            LogoImageType.svg
        )
    )
}
