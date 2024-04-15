//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isDarkModeOn: Bool = false
    @Binding var appearanceSelection: Int
    @StateObject var viewModel = WebView.ProgressViewModel(progress: 0.0)
    @State var isProgressViewVisible: Bool = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $isDarkModeOn, label: {
                CustomTextView(string: "Dark theme", size: 17, weight: .regular, color: UIColor.blackDay)
            })
            .tint(Color.init(uiColor: UIColor.blueUniversal))
            .frame(height: 60)
            .onChange(of: isDarkModeOn) { value in
                value ? (appearanceSelection = 2) : (appearanceSelection = 1)
            }
            NavigationLink(destination: {
                VStack {
                    ProgressView(value: viewModel.progress)
                        .progressViewStyle(.linear)
                        .opacity(isProgressViewVisible ? 1 : 0)
                    WebView(url: URL(string: "https://yandex.ru/legal/practicum_offer/") ?? URL(string: "")!, viewModel: viewModel)
                }
                .padding(.top, 88)
                .ignoresSafeArea()
                .navigationTitle("User agreement")
                .toolbarRole(.editor)
                .onChange(of: viewModel.progress, perform: { value in
                    if value > 0.99 {
                        isProgressViewVisible = false
                    }
                })
            }, label: {
                HStack {
                    Text("User agreement")
                    Spacer()
                    Image(uiImage: UIImage.arrowRight)
                        .tint(Color.init(UIColor.blackDay))
                }
            })
            .frame(height: 60)
            Spacer()
            CustomTextView(string: "The application uses the Yandex.Schedules API \n Version 1.0 (beta)", size: 12, weight: .regular, color: UIColor.blackDay)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }
        .padding(16)
        .tabItem { Image(.settingsTabIcon) }
        .tag(1)
    }
}

#Preview {
    SettingsView(appearanceSelection: ContentView().$appearanceSelection)
}
