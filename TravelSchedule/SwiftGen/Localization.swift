// 🤖 This file was code-generated. Do not edit!!!

import UIKit
// No assets found

// MARK: - Strings
import Foundation

public enum Localization {

    public enum Schedule {

        public enum FromToView {
            /// FromLoc
            public static let from = localize("Schedule.FromToView.from")
            /// ToLoc
            public static let to = localize("Schedule.FromToView.to")
        }

        public enum SearchButtonView {
            /// SearchLoc
            public static let search = localize("Schedule.SearchButtonView.search")
        }
    }
}

extension Localization {

    fileprivate static func localize(_ key: String, _ args: CVarArg...) -> String {
        return String(
            format: NSLocalizedString(key, comment: ""),
            locale: Locale.current,
            arguments: args
        )
    }
}
