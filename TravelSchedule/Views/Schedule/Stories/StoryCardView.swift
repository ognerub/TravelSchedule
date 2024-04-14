//
//  StoryCardView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import SwiftUI

struct StoryCardView: View {
    
    var story: StoryModel
    
    var body: some View {
        Image(uiImage: UIImage(named: story.name) ?? UIImage(systemName: "moon")!)
            .background(
                NavigationLink("", destination: StoriesSingleView(storyName: story.id.uuidString))
            )
            .foregroundStyle(.white)
            .font(.largeTitle)
            .frame(width: 92, height: 140)
            .cornerRadius(16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.init(UIColor.blueUniversal), lineWidth: 4)
            }
    }
}

#Preview {
    StoryCardView(story: StoryModel(id: UUID(), name: "sp1", images: ["_1", "_2"]))
}
