//
//  StoriesSingleView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import SwiftUI

struct StoriesSingleView: View {
    
    var storyName: String
    
    var body: some View {
        Text("Story \(storyName)")
    }
}

#Preview {
    StoriesSingleView(storyName: "noname")
}
