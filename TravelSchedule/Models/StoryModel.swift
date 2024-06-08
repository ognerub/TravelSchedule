//
//  StoryModel.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 08.04.2024.
//

import SwiftUI

struct StoryModel: Identifiable {
    let id: Int
    let name: String
    let images: [String]
    let title: String
    let description: String
    var isShown: Bool
}
