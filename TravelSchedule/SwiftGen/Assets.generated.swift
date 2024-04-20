// 🤖 This file was code-generated. Do not edit!!!

import UIKit

// MARK: - Images
public extension UIImage {
  static let arrowRight: UIImage = UIImage(named: "arrowRight") ?? UIImage()
  static let change: UIImage = UIImage(named: "change") ?? UIImage()
  static let scheduleTabIcon: UIImage = UIImage(named: "scheduleTabIcon") ?? UIImage()
  static let settingsTabIcon: UIImage = UIImage(named: "settingsTabIcon") ?? UIImage()
  static let fgk: UIImage = UIImage(named: "fgk") ?? UIImage()
  static let rzhd: UIImage = UIImage(named: "rzhd") ?? UIImage()
  static let url: UIImage = UIImage(named: "url") ?? UIImage()
  static let bs1: UIImage = UIImage(named: "bs1") ?? UIImage()
  static let bs10: UIImage = UIImage(named: "bs10") ?? UIImage()
  static let bs11: UIImage = UIImage(named: "bs11") ?? UIImage()
  static let bs12: UIImage = UIImage(named: "bs12") ?? UIImage()
  static let bs13: UIImage = UIImage(named: "bs13") ?? UIImage()
  static let bs14: UIImage = UIImage(named: "bs14") ?? UIImage()
  static let bs15: UIImage = UIImage(named: "bs15") ?? UIImage()
  static let bs16: UIImage = UIImage(named: "bs16") ?? UIImage()
  static let bs17: UIImage = UIImage(named: "bs17") ?? UIImage()
  static let bs18: UIImage = UIImage(named: "bs18") ?? UIImage()
  static let bs2: UIImage = UIImage(named: "bs2") ?? UIImage()
  static let bs3: UIImage = UIImage(named: "bs3") ?? UIImage()
  static let bs4: UIImage = UIImage(named: "bs4") ?? UIImage()
  static let bs5: UIImage = UIImage(named: "bs5") ?? UIImage()
  static let bs6: UIImage = UIImage(named: "bs6") ?? UIImage()
  static let bs7: UIImage = UIImage(named: "bs7") ?? UIImage()
  static let bs8: UIImage = UIImage(named: "bs8") ?? UIImage()
  static let bs9: UIImage = UIImage(named: "bs9") ?? UIImage()
  static let sp1: UIImage = UIImage(named: "sp1") ?? UIImage()
  static let sp2: UIImage = UIImage(named: "sp2") ?? UIImage()
  static let sp3: UIImage = UIImage(named: "sp3") ?? UIImage()
  static let sp4: UIImage = UIImage(named: "sp4") ?? UIImage()
  static let sp5: UIImage = UIImage(named: "sp5") ?? UIImage()
  static let sp6: UIImage = UIImage(named: "sp6") ?? UIImage()
  static let sp7: UIImage = UIImage(named: "sp7") ?? UIImage()
  static let sp8: UIImage = UIImage(named: "sp8") ?? UIImage()
  static let sp9: UIImage = UIImage(named: "sp9") ?? UIImage()
  static let noInternet: UIImage = UIImage(named: "noInternet") ?? UIImage()
  static let serverError: UIImage = UIImage(named: "serverError") ?? UIImage()
  static let splashScreen: UIImage = UIImage(named: "splashScreen") ?? UIImage()
}

// MARK: - Colors
public extension UIColor {
  static let accentColor: UIColor = UIColor(named: "AccentColor") ?? UIColor()
  static let blackDay: UIColor = UIColor(named: "BlackDay") ?? UIColor()
  static let blackUniversal: UIColor = UIColor(named: "BlackUniversal") ?? UIColor()
  static let blueUniversal: UIColor = UIColor(named: "BlueUniversal") ?? UIColor()
  static let greyUniversal: UIColor = UIColor(named: "GreyUniversal") ?? UIColor()
  static let lightGrey: UIColor = UIColor(named: "LightGrey") ?? UIColor()
  static let redUniversal: UIColor = UIColor(named: "RedUniversal") ?? UIColor()
  static let whiteDay: UIColor = UIColor(named: "WhiteDay") ?? UIColor()
  static let whiteUniversal: UIColor = UIColor(named: "WhiteUniversal") ?? UIColor()
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
