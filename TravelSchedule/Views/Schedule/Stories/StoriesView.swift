//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 10.04.2024.
//

import SwiftUI

struct StoriesView: View {
    
    @ObservedObject var viewModel = ScheduleViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(viewModel.stories) { story in
                    NavigationLink(destination: Text(story.name),
                                   label: {
                        StoryCardView(story: story)
                    })
                    
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    StoriesView()
}
