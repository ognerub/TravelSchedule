//
//  String+Extensions.swift
//  TravelSchedule
//
//  Created by Ognerub on 10.03.2024.
//

import Foundation

extension String {

    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }

    var getLocalizedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
        guard let date = dateFormatter.date(from: self) else { return "API date format wrong" }
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }

    var getLocalizedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
        guard let date = dateFormatter.date(from: self) else { return "API date format wrong" }
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: date)
    }

    var getLocalizedShortDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: self) else { return "API date format wrong" }
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: date)
    }

    func slice(from: String, to: String) -> String? {
        guard let rangeFrom = range(of: from)?.upperBound else { return nil }
        guard let rangeTo = self[rangeFrom...].range(of: to)?.lowerBound else { return nil }
        return String(self[rangeFrom..<rangeTo])
    }
}

extension Int {
    var getLocalizedInterval: String {
        let interval = self
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "ru_RU")
        let formatter = DateComponentsFormatter()
        formatter.calendar = calendar

        formatter.unitsStyle = .full
        formatter.allowedUnits = interval > 60 * 60 * 24 // 1 day in seconds
        ? [.day, .hour]
        : [.hour, .minute]
        return formatter.string(from: TimeInterval(Double(interval))) ?? "today"
    }
}
