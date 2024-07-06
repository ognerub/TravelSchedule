//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 10.04.2024.
//

import SwiftUI

struct StoriesView: View {
    
    @ObservedObject var viewModel: StoriesViewModel
    @Binding var isStoriesPresented: Bool
    @State var selectedStoryId: Int = 0
    @State var currentStoryIndex: Int = 0
    @State var currentProgress: CGFloat = 0

    var timerConfiguration: TimerConfiguration

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 12) {
              ForEach(viewModel.stories.indices, id: \.self) { index in
                    Button(action: {
                        isStoriesPresented.toggle()
                      currentStoryIndex = index
                      viewModel.stories[index].isShown = true
                    }, label: {
                      StoryCardView(story: viewModel.stories[index])
                    })
                }
            }
            .padding(16)
            .fullScreenCover(isPresented: $isStoriesPresented, content: {
              ZStack(alignment: .topTrailing) {
                StoriesTabView(stories: viewModel.stories, currentStoryIndex: $currentStoryIndex)
                  StoriesProgressBar(
                    storiesCount: viewModel.stories.count,
                      timerConfiguration: timerConfiguration,
                      currentProgress: $currentProgress
                  )
                  .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
              }
            })
        }
        .onChange(of: currentStoryIndex) { [currentStoryIndex] newValue in
          viewModel.stories[newValue].isShown = true
          didChangeCurrentIndex(oldIndex: currentStoryIndex, newIndex: newValue)
        }
        .onChange(of: currentProgress) { value in
          didChangeCurrentProgress(newProgress: value)
        }
    }

  private func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
      guard oldIndex != newIndex else { return }
      let progress = timerConfiguration.progress(for: newIndex)
      guard abs(progress - currentProgress) >= 0.01 else { return }
      withAnimation {
          currentProgress = progress
      }
  }

  private func didChangeCurrentProgress(newProgress: CGFloat) {
      let index = timerConfiguration.index(for: newProgress)
      guard index != currentStoryIndex else { return }
      withAnimation {
          currentStoryIndex = index
      }
  }
}

#Preview {
  struct PreviewStruct: View {
    @State var isStoriesPresented: Bool = false
    @StateObject var viewModel = StoriesViewModel()

    var body: some View {
      StoriesView(viewModel: viewModel, isStoriesPresented: $isStoriesPresented, selectedStoryId: 0, timerConfiguration: TimerConfiguration(storiesCount: viewModel.stories.count))
    }
  }
  return PreviewStruct(isStoriesPresented: false)
}
