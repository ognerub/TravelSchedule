//
//  SVGAsyncImageViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 20.07.2024.
//

import SwiftUI
import SVGKit

@MainActor
final class SVGAsyncImageViewModel: ObservableObject {
    @Published var image: SVGKImage? = nil
    @Published var isLoading = true

    func loadSVGImage(url: URL?) async {
        guard let url = url else {
            isLoading = false
            return
        }
        isLoading = true
        do {
            let svgImage = try await fetchSVGImage(from: url)
            image = svgImage
            isLoading = false
        } catch {
            print("Error loading image: \(error.localizedDescription)")
            isLoading = false
        }
    }

    private func fetchSVGImage(from url: URL) async throws -> SVGKImage? {
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data {
                    let svgImage = SVGKImage(data: data)
                    continuation.resume(returning: svgImage)
                } else {
                    continuation.resume(returning: nil)
                }
            }.resume()
        }
    }
}

extension SVGKImage: @unchecked Sendable { }
