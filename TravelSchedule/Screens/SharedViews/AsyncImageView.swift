//
//  AsyncImageView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.07.2024.
//

import SwiftUI
import Kingfisher

struct AsyncImageView: View {
    let urlString: String?

    var body: some View {
        Group {
            if let urlString = urlString,
                let url = URL(string: urlString) {
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image(systemName: "nosign")
            }
        }
    }
}

#Preview {
    AsyncImageView(urlString: "")
}
