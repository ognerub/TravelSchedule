//
//  StoriesViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 06.07.2024.
//

import SwiftUI

final class StoriesViewModel: ObservableObject {
    @Published var stories: [StoryModel] = Mocks.stories
}

public enum Mocks {
  static let stories: [StoryModel] = [
    StoryModel(id: 0, name: "sp1", images: ["bs1", "bs2"], title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isShown: false),
    StoryModel(id: 1, name: "sp2", images: ["bs3", "bs4"], title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isShown: false),
    StoryModel(id: 2, name: "sp3", images: ["bs5", "bs6"], title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isShown: false),
    StoryModel(id: 3, name: "sp4", images: ["bs7", "bs8"], title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isShown: false),
    StoryModel(id: 4, name: "sp5", images: ["bs9", "bs10"], title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isShown: false),
    StoryModel(id: 5, name: "sp6", images: ["bs11", "bs12"], title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isShown: false),
    StoryModel(id: 6, name: "sp7", images: ["bs13", "bs14"], title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isShown: false),
    StoryModel(id: 7, name: "sp8", images: ["bs15", "bs16"], title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isShown: false)
  ]
}
