//
//  RoutesListView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

import SwiftUI

struct RoutesListView: View {
    
    @StateObject var viewModel = RoutesListViewModel()
    
    var fromCode: String
    var toCode: String
    @State var fromToString: String
    @State var isMorningFilterOn: Bool = true
    @State var isAfternoonFilterOn: Bool = true
    @State var isEveningFilterOn: Bool = true
    @State var isNightFilterOn: Bool = true
    @State var isTransfersFilterOn: Bool = true
    @State var isRedDotVisible: Bool = false
    
    var body: some View {
        let filteredRoutes = getFilteredRoutes()
        ZStack {
            ZStack {
                if filteredRoutes.count > 0 {
                    ScrollView {
                        VStack(spacing: 16) {
                            Text(fromToString)
                                .font(Font.system(size: 24, weight: .bold))
                                .foregroundColor(Color.init(uiColor: UIColor.blackDay))
                            VStack(spacing: 8) {
                                ForEach(filteredRoutes) { route in
                                    NavigationLink(destination: {
                                        CarrierCardView(carrier: CarrierCardModel(logo: route.logo.0, logoType: route.logo.1, name: route.companyTitle, email: route.companyEmail, phone: route.companyPhone))
                                            .navigationBarTitleDisplayMode(.inline)
                                            .toolbar {
                                                ToolbarItem(placement: .principal) {
                                                    VStack {
                                                        CustomTextView(string: Localization.CarrierCardView.Navigation.title, size: 17, weight: .bold, color: UIColor.blackDay)
                                                    }
                                                }
                                            }
                                    }, label: {
                                        RouteCardView(
                                            route: route,
                                            logoTurple: (
                                                URL(string: route.logo.0),
                                                route.logo.1
                                            ))
                                    })
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .padding(.bottom, 80)
                } else {
                    VStack {
                        Text(fromToString)
                            .font(Font.system(size: 24, weight: .bold))
                            .foregroundColor(Color.init(uiColor: UIColor.blackDay))
                        Spacer()
                        CustomTextView(string: "There are no options", size: 24, weight: .bold, color: UIColor.blackDay)
                            .opacity(viewModel.isLoading ? 0 : 1)
                        Spacer()
                    }
                }
                VStack {
                    Spacer()
                    NavigationLink(destination: {
                        SpecifyTimeView(
                            isMorningFilterOn: $isMorningFilterOn,
                            isAfternoonFilterOn: $isAfternoonFilterOn,
                            isEveningFilterOn: $isEveningFilterOn,
                            isNightFilterOn: $isNightFilterOn,
                            isTransfersFilterOn: $isTransfersFilterOn
                        )
                    },
                                   label: {
                        InfinityWidthButtonView(
                            string: Localization.Schedule.SpecifyButtonView.filter,
                            isRedDotVisible: $isRedDotVisible
                        )
                    })
                    .navigationTitle("")
                    .toolbarRole(.editor)
                }
            }
            ProgressView()
                .opacity(viewModel.isLoading ? 1 : 0)
        }
        .onAppear() {
            let isAnyFilterOff = viewModel.isAnyFilterOff(isMorningFilterOn: isMorningFilterOn, isAfternoonFilterOn: isAfternoonFilterOn, isEveningFilterOn: isEveningFilterOn, isNightFilterOn: isNightFilterOn, isTransfersFilterOn: isTransfersFilterOn)
            isRedDotVisible = isAnyFilterOff
            if viewModel.routesArray.isEmpty {
                viewModel.pointToPoint(fromCode: fromCode, toCode: toCode)
            }
        }
    }
    
    private func getFilteredRoutes() -> [RouteModel] {
        return viewModel.getFilteredRoutes(
            isMorningFilterOn: isMorningFilterOn,
            isAfternoonFilterOn: isAfternoonFilterOn,
            isEveningFilterOn: isEveningFilterOn,
            isNightFilterOn: isNightFilterOn,
            isTransfersFilterOn: isTransfersFilterOn)
    }
}

#Preview {
    RoutesListView(fromCode: "", toCode: "", fromToString: "Moscow (Kievsky railway station) → Saint-Petersburg (Baltiysky railway station)")
}
