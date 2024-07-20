//
//  NoNetworkView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI

enum NetworkErrorType {
    case noInternet
    case serverError
}

struct NoNetworkView: View {
    
    let action: (() -> Void)?
    let errorType: NetworkErrorType
    
    var body: some View {
        ZStack {
            VStack{
                Image(uiImage: getImage())
                CustomTextView(string: getTitle(), size: 24, weight: .bold, color: UIColor.blackDay)
                    .padding(16)
            }
            VStack(alignment: .leading) {
                Button(action: {
                    (action ?? { })()
                }, label: {
                    Image(uiImage: UIImage(systemName: "xmark") ?? UIImage())
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(20)
                Spacer()
            }
            .opacity(action != nil ? 1 : 0)
        }
        
    }
    
    private func getTitle() -> String {
        switch errorType {
        case .noInternet:
            return "No internet"
        case .serverError:
            return "Server error"
        }
    }
    
    private func getImage() -> UIImage {
        switch errorType {
        case .noInternet:
            return UIImage.noInternet
        case .serverError:
            return UIImage.serverError
        }
    }
}

#Preview {
    NoNetworkView(action: nil, errorType: .serverError)
}
