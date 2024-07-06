// 🤖 This file was code-generated. Do not edit!!!

import UIKit
// No assets found

// MARK: - Strings
import Foundation

public enum Localization {

    public enum CarrierCardView {
        /// No information
        public static let empty = localize("CarrierCardView.empty")

        public enum Navigation {
            /// Carrier information
            public static let title = localize("CarrierCardView.Navigation.title")
        }
    }

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
        /// With transfer in 
        public static let transfer = localize("Schedule.transfer")

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

        public enum SpecifyTimeView {
            /// Afternoon
            public static let afternoon = localize("Schedule.SpecifyTimeView.afternoon")
            /// Apply
            public static let apply = localize("Schedule.SpecifyTimeView.apply")
            /// Departure time
            public static let departureTime = localize("Schedule.SpecifyTimeView.departureTime")
            /// Evening
            public static let evening = localize("Schedule.SpecifyTimeView.evening")
            /// Morning
            public static let morning = localize("Schedule.SpecifyTimeView.morning")
            /// Night
            public static let night = localize("Schedule.SpecifyTimeView.night")
            /// No
            public static let no = localize("Schedule.SpecifyTimeView.no")
            /// Show route options with transfers
            public static let showTransfers = localize("Schedule.SpecifyTimeView.showTransfers")
            /// Yes
            public static let yes = localize("Schedule.SpecifyTimeView.yes")
        }
    }

    public enum SettingsView {
        /// Dark theme
        public static let darkTheme = localize("SettingsView.darkTheme")
        /// The application uses the Yandex.Schedules API \n Version 1.0 (beta)
        public static let license = localize("SettingsView.license")
        /// User agreement
        public static let userAgreement = localize("SettingsView.userAgreement")
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
