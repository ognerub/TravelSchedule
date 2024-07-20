//
//  SettingsScreenView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI
import Network
import WebKit

struct SettingsScreenView: View {
    
    @State private var isDarkModeOn: Bool = false
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack {
            Toggle(isOn: $isDarkModeOn, label: {
                CustomTextView(string: Localization.SettingsView.darkTheme, size: 17, weight: .regular, color: UIColor.blackDay)
            })
            .tint(Color.init(uiColor: UIColor.blueUniversal))
            .frame(height: 60)
            .onChange(of: isDarkModeOn) { value in
                value ? (viewModel.appearanceSelection = 2) : (viewModel.appearanceSelection = 1)
            }
            NavigationLink(destination: {
                if viewModel.isConnected {
                    VStack {
                        if let urlString: URL = URL(string: "https://yandex.ru/legal/practicum_offer/") {
                            WebView(url: urlString, webView: WKWebView())
                        }
                    }
                    .padding(.top, 88)
                    .ignoresSafeArea()
                    .navigationTitle(Localization.SettingsView.userAgreement)
                    .toolbarRole(.editor)
                } else {
                    NoNetworkView(action: nil, errorType: .noInternet)
                }
            }, label: {
                HStack {
                    Text(Localization.SettingsView.userAgreement)
                    Spacer()
                    Image(uiImage: UIImage.arrowRight)
                        .tint(Color.init(UIColor.blackDay))
                }
            })
            .frame(height: 60)
            Spacer()
            CustomTextView(string: Localization.SettingsView.license, size: 12, weight: .regular, color: UIColor.blackDay)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
        }
        .padding(16)
        .onAppear {
            if viewModel.appearanceSelection > 1 { isDarkModeOn = true }
        }
        .task {
            viewModel.checkInternetConnection()
        }
    }
}
