//
//  WebView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let url: URL
    @ObservedObject var viewModel: ProgressViewModel

    private let webView = WKWebView()

    func makeUIView(context: Context) -> WKWebView {
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {

    }
}

extension WebView {

    func makeCoordinator() -> Coordinator {
        Coordinator(self, viewModel: viewModel)
    }

    class Coordinator: NSObject {
        private var parent: WebView
        private var viewModel: ProgressViewModel
        private var observer: NSKeyValueObservation?

        init(_ parent: WebView, viewModel: ProgressViewModel) {
            self.parent = parent
            self.viewModel = viewModel
            super.init()

            observer = self.parent.webView.observe(\.estimatedProgress) { [weak self] webView, _ in
                guard let self = self else { return }
                self.parent.viewModel.progress = webView.estimatedProgress
            }
        }

        deinit {
            observer = nil
        }
    }
}

extension WebView {
    class ProgressViewModel: ObservableObject {
        @Published var progress: Double = 0.0
        
        init (progress: Double) {
            self.progress = progress
        }
    }
}

#Preview {
    WebView(url: URL(string: "https://ya.ru")!, viewModel: WebView.ProgressViewModel(progress: 0))
}
