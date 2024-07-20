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

    public enum RoutesListView {
        /// There are no options
        public static let noOptions = localize("RoutesListView.noOptions")
    }

    public enum Schedule {
        /// Loading...
        public static let loading = localize("Schedule.loading")
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
        /// Airport
        public static let airport = localize("StationSelection.airport")
        /// Bus station
        public static let busStation = localize("StationSelection.bus_station")
        /// Bus stop
        public static let busStop = localize("StationSelection.bus_stop")
        /// Marine station
        public static let marineStation = localize("StationSelection.marine_station")
        /// Platform
        public static let platform = localize("StationSelection.platform")
        /// Port
        public static let port = localize("StationSelection.port")
        /// Post
        public static let post = localize("StationSelection.post")
        /// River port
        public static let riverPort = localize("StationSelection.river_port")
        /// Station
        public static let station = localize("StationSelection.station")
        /// Stop
        public static let stop = localize("StationSelection.stop")
        /// Train station
        public static let trainStation = localize("StationSelection.train_station")
        /// Unknown
        public static let unknown = localize("StationSelection.unknown")
        /// Wharf
        public static let wharf = localize("StationSelection.wharf")

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
