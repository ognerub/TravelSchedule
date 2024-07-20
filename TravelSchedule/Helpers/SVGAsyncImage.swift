//
//  SVGAsyncImage.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.07.2024.
//

import SwiftUI

struct SVGAsyncImage: Sendable, View {
    
    let url: URL?
    
    @ObservedObject var viewModel = SVGAsyncImageViewModel()
    
    var body: some View {
        Group {
            if let image = viewModel.image {
                Image(uiImage: image.uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "nosign")
            }
        }
        .task {
            await viewModel.loadSVGImage(url: url)
        }
    }
}

