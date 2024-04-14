// 🤖 This file was code-generated. Do not edit!!!

import UIKit
// No assets found

// MARK: - Strings
import Foundation

public enum Localization {

    public enum CitySelection {

        public enum CitiesCodes {
            /// Sochi
            public static let aer = localize("CitySelection.CitiesCodes.AER")
            /// Krasnodar
            public static let krr = localize("CitySelection.CitiesCodes.KRR")
            /// Kazan
            public static let kzn = localize("CitySelection.CitiesCodes.KZN")
            /// Saint-Petersburg
            public static let led = localize("CitySelection.CitiesCodes.LED")
            /// Moscow
            public static let mow = localize("CitySelection.CitiesCodes.MOW")
            /// Omsk
            public static let oms = localize("CitySelection.CitiesCodes.OMS")
        }

        public enum Navigation {
            /// City selection
            public static let title = localize("CitySelection.Navigation.title")
        }
    }

    public enum Schedule {

        public enum FromToView {
            /// From
            public static let from = localize("Schedule.FromToView.from")
            /// To
            public static let to = localize("Schedule.FromToView.to")
        }

        public enum SearchButtonView {
            /// Search
            public static let search = localize("Schedule.SearchButtonView.search")
        }

        public enum SpecifyButtonView {
            /// Specify time
            public static let filter = localize("Schedule.SpecifyButtonView.filter")
        }
    }

    public enum StationSelection {

        public enum Navigation {
            /// Station selection
            public static let title = localize("StationSelection.Navigation.title")
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
