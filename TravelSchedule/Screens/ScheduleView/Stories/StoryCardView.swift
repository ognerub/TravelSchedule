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
        ZStack(alignment: .bottom) {
            Image(uiImage: UIImage(named: story.name) ?? UIImage(systemName: "nosign") ?? UIImage())
                .background(
                    NavigationLink("", destination: StoriesSingleView(storyName: story.name))
                )
                .foregroundStyle(.white)
                .font(.largeTitle)
                .frame(width: 92, height: 140)
                .cornerRadius(16)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.init(UIColor.blueUniversal), lineWidth: story.isShown ? 0 : 4)
                }
            Text(story.title)
                .foregroundColor(Color(uiColor: UIColor.whiteUniversal))
                .font(Font.system(size: 12, weight: .regular))
                .frame(width: 89, alignment: .leading)
                .padding(8)
                .lineLimit(3)
        }
        .frame(width: 92, height: 140)
        .opacity(story.isShown ? 0.5 : 1)
    }
}

#Preview {
    StoryCardView(story: StoryModel(id: 0, name: "sp1", images: ["bs1", "bs2"], title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isShown: false))
}
