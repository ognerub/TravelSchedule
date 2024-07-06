//
//  SVGAsyncImage.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.07.2024.
//

import SwiftUI
import SVGKit

struct SVGAsyncImage: View {
    let url: URL?

    @State private var image: SVGKImage? = nil
    @State private var isLoading = true

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image.uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if isLoading {
                ProgressView()
            } else {
                Image(systemName: "nosign")
            }
        }
        .onAppear {
            loadSVGImage()
        }
    }

    private func loadSVGImage() {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let svgImage = SVGKImage(data: data)
                DispatchQueue.main.async {
                    self.image = svgImage
                    self.isLoading = false
                }
            } else {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
            if let error = error {
                print("error to load image \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }
}

