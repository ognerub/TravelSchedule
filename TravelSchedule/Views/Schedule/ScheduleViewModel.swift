//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import Foundation

final class ScheduleViewModel: ObservableObject {
    
    @Published var stories: [StoryModel] = [
        StoryModel(id: UUID(), name: "sp1", images: ["_1", "_2"]),
        StoryModel(id: UUID(), name: "sp2", images: ["_3", "_4"]),
        StoryModel(id: UUID(), name: "sp3", images: ["_5", "_6"]),
        StoryModel(id: UUID(), name: "sp4", images: ["_7", "_8"]),
        StoryModel(id: UUID(), name: "sp5", images: ["_9", "_10"]),
        StoryModel(id: UUID(), name: "sp6", images: ["_11", "_12"]),
        StoryModel(id: UUID(), name: "sp7", images: ["_13", "_14"]),
        StoryModel(id: UUID(), name: "sp8", images: ["_15", "_16"]),
    ]
}
