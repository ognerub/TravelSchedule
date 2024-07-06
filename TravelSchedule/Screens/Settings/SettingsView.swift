//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI
import Network

struct SettingsView: View {
    
    @State private var isConnected = true
    
    @State var isDarkModeOn: Bool = false
    @State var isProgressViewVisible: Bool = true
    @Binding var appearanceSelection: Int
    @StateObject var viewModel = WebView.ProgressViewModel(progress: 0.0)
    
    var body: some View {
        VStack {
            Toggle(isOn: $isDarkModeOn, label: {
                CustomTextView(string: Localization.SettingsView.darkTheme, size: 17, weight: .regular, color: UIColor.blackDay)
            })
            .tint(Color.init(uiColor: UIColor.blueUniversal))
            .frame(height: 60)
            .onChange(of: isDarkModeOn) { value in
                value ? (appearanceSelection = 2) : (appearanceSelection = 1)
            }
            NavigationLink(destination: {
                if isConnected {
                    VStack {
                        ProgressView(value: viewModel.progress)
                            .progressViewStyle(.linear)
                            .opacity(isProgressViewVisible ? 1 : 0)
                        if let urlString: URL = URL(string: "https://yandex.ru/legal/practicum_offer/") {
                            WebView(url: urlString, viewModel: viewModel)
                        }
                    }
                    .padding(.top, 88)
                    .ignoresSafeArea()
                    .navigationTitle(Localization.SettingsView.userAgreement)
                    .toolbarRole(.editor)
                    .onChange(of: viewModel.progress, perform: { value in
                        if value > 0.99 {
                            isProgressViewVisible = false
                        }
                    })
                } else {
                    NoNetworkView(errorType: .noInternet)
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
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }
        .padding(16)
        .onAppear {
            checkInternetConnection()
            if appearanceSelection > 1 { isDarkModeOn = true }
        }
    }
    
    func checkInternetConnection() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = (path.status == .satisfied)
            }
        }
        let queue = DispatchQueue(label: "InternetMonitor")
        monitor.start(queue: queue)
    }
}
