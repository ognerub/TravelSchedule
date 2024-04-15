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
        ZStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 16) {
                        Text(fromToString)
                            .font(Font.system(size: 24, weight: .bold))
                            .foregroundColor(Color.init(uiColor: UIColor.blackDay))
                        VStack(spacing: 8) {
                            ForEach(viewModel.routesArray) { route in
                                NavigationLink(destination: {
                                    CarrierCardView(logo: route.logo)
                                        .navigationBarTitleDisplayMode(.inline)
                                                .toolbar {
                                                    ToolbarItem(placement: .principal) {
                                                        VStack {
                                                            CustomTextView(string: Localization.CarrierCardView.Navigation.title, size: 17, weight: .bold, color: UIColor.blackDay)
                                                        }
                                                    }
                                                }
                                }, label: {
                                    RouteCardView(route: route)
                                })
                                
                                //.navigationTitle(Localization.CarrierCardView.Navigation.title)
                                //.toolbarRole(.editor)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 80)
                }
            }
            VStack {
                Spacer()
                NavigationLink(destination: {
                    SpecifyTimeView()
                }, label: {
                    InfinityWidthButtonView(string: Localization.Schedule.SpecifyButtonView.filter)
                })
                .navigationTitle("")
                .toolbarRole(.editor)
            }
        }
    }
}

#Preview {
    RoutesListView(fromToString: "Moscow (Kievsky railway station) → Saint-Petersburg (Baltiysky railway station)")
}
