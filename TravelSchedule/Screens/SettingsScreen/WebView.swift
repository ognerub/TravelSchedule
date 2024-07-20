//
//  WebView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI
import WebKit

struct WebView: Sendable, UIViewRepresentable {
    
    let url: URL
    
    private let webView: WKWebView
    
    init(url: URL, webView: WKWebView) {
        self.url = url
        self.webView = webView
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
