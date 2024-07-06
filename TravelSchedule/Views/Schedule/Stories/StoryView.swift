//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 30.05.2024.
//

import SwiftUI

struct StoryView: View {
    let story: StoryModel

  @Environment(\.dismiss) private var dismiss
  @ObservedObject var viewModel = ScheduleViewModel()

    var body: some View {
      ZStack(alignment: .topTrailing){
          Image(uiImage: UIImage(named: story.images[0]) ?? UIImage(systemName: "nosign") ?? UIImage())
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
          Button(action: {
            dismiss()
          }, label: {
            Image(uiImage: UIImage.close)
          })
          .padding(.top, 53)
          .padding(.trailing, 15)
        }
            .overlay(
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text(story.title)
                        .font(Font.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(2)
                        Text(story.description)
                        .font(Font.system(size: 20, weight: .regular))
                            .lineLimit(3)
                            .foregroundColor(.white)
                    }
                    .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
                }
            )

    }
}

#Preview {
  struct PreviewView: View {
    @StateObject var viewModel = ScheduleViewModel()
    var body: some View {
      StoryView(story: viewModel.stories[0])
    }
  }
  return PreviewView()
}
