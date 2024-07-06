//
//  AsyncImageView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.07.2024.
//

import SwiftUI
import Kingfisher

struct AsyncImageView: View {
    let url: URL?

    var body: some View {
        Group {
            if let url = url {
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
    AsyncImageView(url: URL(string: ""))
}
