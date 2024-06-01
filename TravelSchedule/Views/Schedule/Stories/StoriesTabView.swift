//
//  StoriesTabView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 01.06.2024.
//

import SwiftUI

struct StoriesTabView: View {
    let stories: [StoryModel]
    @Binding var currentStoryIndex: Int

    var body: some View {
        TabView(selection: $currentStoryIndex) {
            ForEach(stories) { story in
                StoryView(story: story)
                    .onTapGesture {
                        didTapStory()
                    }
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }

    func didTapStory() {
        currentStoryIndex = min(currentStoryIndex + 1, stories.count - 1)
    }
}
