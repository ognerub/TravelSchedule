//
//  RoutesListView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

import SwiftUI

struct RoutesListView: View {
    
    @State var fromToString: String
    @StateObject var viewModel = RoutesListViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(fromToString)
                    .font(Font.system(size: 24, weight: .bold))
                    .foregroundColor(Color.init(uiColor: UIColor.blackDay))
                VStack(spacing: 8) {
                    ForEach(viewModel.routesArray) { route in
                        RouteCardView(route: route)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    RoutesListView(fromToString: "Moscow (Kievsky railway station) → Saint-Petersburg (Baltiysky railway station)")
}
