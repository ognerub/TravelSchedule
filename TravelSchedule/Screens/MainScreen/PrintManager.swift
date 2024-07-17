//
//  PrintManager.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 17.07.2024.
//

import SwiftUI
import Combine

class PrintManager: ObservableObject {
    @Published var output: String = ""

    static let shared = PrintManager()

    private init() {}

    func print(_ items: Any...) {
        let outputString = items.map { "\($0)" }.joined(separator: " ")
        DispatchQueue.main.async {
            self.output = "\(outputString)\n"
        }
    }
}
