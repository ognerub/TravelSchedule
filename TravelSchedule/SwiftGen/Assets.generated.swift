// 🤖 This file was code-generated. Do not edit!!!

import SwiftUI

// MARK: - Images
public extension UIImage {
  static let scheduleTabIcon: UIImage = UIImage(named: "ScheduleTabIcon")!
  static let settingsTabIcon: UIImage = UIImage(named: "SettingsTabIcon")!
  static let сhange: UIImage = UIImage(named: "Сhange")!
  static let splashScreen: UIImage = UIImage(named: "SplashScreen")!
  static let _1: UIImage = UIImage(named: "1")!
  static let _10: UIImage = UIImage(named: "10")!
  static let _11: UIImage = UIImage(named: "11")!
  static let _12: UIImage = UIImage(named: "12")!
  static let _13: UIImage = UIImage(named: "13")!
  static let _14: UIImage = UIImage(named: "14")!
  static let _15: UIImage = UIImage(named: "15")!
  static let _16: UIImage = UIImage(named: "16")!
  static let _17: UIImage = UIImage(named: "17")!
  static let _18: UIImage = UIImage(named: "18")!
  static let _2: UIImage = UIImage(named: "2")!
  static let _3: UIImage = UIImage(named: "3")!
  static let _4: UIImage = UIImage(named: "4")!
  static let _5: UIImage = UIImage(named: "5")!
  static let _6: UIImage = UIImage(named: "6")!
  static let _7: UIImage = UIImage(named: "7")!
  static let _8: UIImage = UIImage(named: "8")!
  static let _9: UIImage = UIImage(named: "9")!
  static let sp1: UIImage = UIImage(named: "Sp1")!
  static let sp2: UIImage = UIImage(named: "Sp2")!
  static let sp3: UIImage = UIImage(named: "Sp3")!
  static let sp4: UIImage = UIImage(named: "Sp4")!
  static let sp5: UIImage = UIImage(named: "Sp5")!
  static let sp6: UIImage = UIImage(named: "Sp6")!
  static let sp7: UIImage = UIImage(named: "Sp7")!
  static let sp8: UIImage = UIImage(named: "Sp8")!
  static let sp9: UIImage = UIImage(named: "Sp9")!
}

// MARK: - Colors
public extension UIColor {
  static let accentColor: UIColor = UIColor(named: "AccentColor")!
  static let blackDay: UIColor = UIColor(named: "BlackDay")!
  static let blueUniversal: UIColor = UIColor(named: "BlueUniversal")!
  static let greyUniversal: UIColor = UIColor(named: "GreyUniversal")!
  static let whiteDay: UIColor = UIColor(named: "WhiteDay")!
  static let whiteUniversal: UIColor = UIColor(named: "WhiteUniversal")!
}

// MARK: - Strings
import Foundation

public enum L10n {
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
