//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import Foundation

final class ScheduleViewModel: ObservableObject {
    @Published var stories: [StoryModel] = [
        StoryModel(id: UUID(), name: "Sp1", images: ["_1", "_2"]),
        StoryModel(id: UUID(), name: "Sp2", images: ["_3", "_4"]),
        StoryModel(id: UUID(), name: "Sp3", images: ["_5", "_6"]),
        StoryModel(id: UUID(), name: "Sp4", images: ["_7", "_8"]),
        StoryModel(id: UUID(), name: "Sp5", images: ["_9", "_10"]),
        StoryModel(id: UUID(), name: "Sp6", images: ["_11", "_12"]),
        StoryModel(id: UUID(), name: "Sp7", images: ["_13", "_14"]),
        StoryModel(id: UUID(), name: "Sp8", images: ["_15", "_16"]),
    ]
}
