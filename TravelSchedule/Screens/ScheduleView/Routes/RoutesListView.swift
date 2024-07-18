//
//  RoutesListView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 14.04.2024.
//

import SwiftUI

import SwiftUI

struct RoutesListView: View {

    @ObservedObject var viewModel: RoutesListViewModel

    @State private var isMorningFilterOn = true
    @State private var isAfternoonFilterOn = true
    @State private var isEveningFilterOn = true
    @State private var isNightFilterOn = true
    @State private var isTransfersFilterOn = true
    @State private var isRedDotVisible = false

    var body: some View {
        ZStack {
            ZStack {
                if getFilteredRoutes().count > 0 {
                    routesListScrollView
                } else {
                    noOptionsView
                }
                specifyTimeButton
            }
            ProgressView()
                .opacity(viewModel.isLoading ? 1 : 0)
        }
        .onAppear() {
            let isAnyFilterOff = viewModel.isAnyFilterOff(isMorningFilterOn: isMorningFilterOn, isAfternoonFilterOn: isAfternoonFilterOn, isEveningFilterOn: isEveningFilterOn, isNightFilterOn: isNightFilterOn, isTransfersFilterOn: isTransfersFilterOn)
            isRedDotVisible = isAnyFilterOff
        }
        .task {
            if viewModel.routesArray.isEmpty {
                await viewModel.pointToPoint()
            }
        }
    }

    var routesListScrollView: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(viewModel.fromToString)
                    .font(Font.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.init(uiColor: UIColor.blackDay))
                VStack(spacing: 8) {
                    ForEach(getFilteredRoutes()) { route in
                        NavigationLink(destination: {
                            CarrierCardView(viewModel: CarrierCardViewModel(carrier: CarrierCardModel(logo: route.logo.0, logoType: route.logo.1, name: route.companyTitle, email: route.companyEmail, phone: route.companyPhone)))
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
    }

    var specifyTimeButton: some View {
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

    var noOptionsView: some View {
        VStack {
            Text(viewModel.fromToString)
                .font(Font.system(size: 24, weight: .bold))
                .foregroundColor(Color.init(uiColor: UIColor.blackDay))
            Spacer()
            CustomTextView(string: Localization.RoutesListView.noOptions, size: 24, weight: .bold, color: UIColor.blackDay)
                .opacity(viewModel.isLoading ? 0 : 1)
            Spacer()
        }
        .padding(.horizontal, 16)
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
    RoutesListView(viewModel: RoutesListViewModel(fromCode: "", toCode: "", fromToString: "Moscow (Kievsky railway station) → Saint-Petersburg (Baltiysky railway station)", networkService: NetworkService()))
}
