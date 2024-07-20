//
//  DateManager.swift
//  TravelSchedule
//
//  Created by Alexander Ognerubov on 20.07.2024.
//

import SwiftUI

final class DateManager: ObservableObject {

    private let baseDateFormatter = DateFormatter()
    private let fullDateFormatter = DateFormatter()
    private let timeDateFormatter = DateFormatter()
    private let dayDateFormatter = DateFormatter()

    init() {
        baseDateFormatter.dateFormat = "yyyy-MM-dd"
        fullDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
        timeDateFormatter.dateFormat = "HH:mm"
        dayDateFormatter.dateFormat = "dd MMMM"
    }

    func getString(from date: Date) -> String {
        return baseDateFormatter.string(from: date)
    }

    func getLocalizedTime(from string: String?) -> String? {
        guard let string = string,
              let date = checkDate(from: string) else { return nil}
        return timeDateFormatter.string(from: date)
    }

    func getLocalizedDate(from string: String?) -> String? {
        guard let string = string,
              let date = checkDate(from: string) else { return nil}
        return dayDateFormatter.string(from: date)
    }

    func getLocalizedShortDate(from string: String?) -> String? {
        guard let string = string,
              let date = checkDate(from: string) else { return nil}
        return dayDateFormatter.string(from: date)
    }

    private func checkDate(from string: String) -> Date? {
        guard let date = fullDateFormatter.date(from: string) else { return nil }
        return date
    }
}
