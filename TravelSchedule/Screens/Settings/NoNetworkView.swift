//
//  NoNetworkView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 15.04.2024.
//

import SwiftUI

struct NoNetworkView: View {
    
    enum NetworkErrorType {
        case noInternet
        case serverError
    }
    
    @State var errorType: NetworkErrorType
    
    var body: some View {
        Image(uiImage: getImage())
        CustomTextView(string: getTitle(), size: 24, weight: .bold, color: UIColor.blackDay)
            .padding(16)
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
    NoNetworkView(errorType: .serverError)
}
