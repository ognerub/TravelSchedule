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
        GeometryReader { geometry in
            ZStack {
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
            Rectangle()
                .foregroundColor(Color.black.opacity(0.01))
                .contentShape(Rectangle())
                .frame(width: geometry.size.width / 3, height: geometry.size.height)
                .gesture(
                    TapGesture()
                        .onEnded {
                            didTapBackStory()
                        }
                )
                .position(x: geometry.size.width / 6, y: geometry.size.height / 2)
        }
    }
    
    func didTapStory() {
        currentStoryIndex = min(currentStoryIndex + 1, stories.count - 1)
    }
    
    func didTapBackStory() {
        if currentStoryIndex > 0 {
            currentStoryIndex = min(currentStoryIndex - 1, stories.count + 1)
        }
    }
}
