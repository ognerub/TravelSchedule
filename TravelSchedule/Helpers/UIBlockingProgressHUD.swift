//
//  UIBlockingProgressHUD.swift
//  TravelSchedule
//
//  Created by Ognerub on 11.03.2024.
//

import UIKit

protocol UIBlockingProgressHUDProtocol: AnyObject {
    func showCustom()
    func dismissCustom()
}

final class UIBlockingProgressHUD: UIBlockingProgressHUDProtocol {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    private var window: UIWindow? {
      let allScenes = UIApplication.shared.connectedScenes
        for scene in allScenes {
          guard let windowScene = scene as? UIWindowScene else { continue }
          for window in windowScene.windows where window.isKeyWindow {
             return window
           }
         }
      return nil
    }

    private var customView: UIView?

    func showCustom() {
        window?.isUserInteractionEnabled = false
        self.customView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        guard let customView = customView,
              let viewController = viewController
        else { return }
        customView.backgroundColor = .clear
        viewController.view.addSubview(customView)
        customView.center = viewController.view.center
        let activity = UIActivityIndicatorView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: customView.frame.width,
                height: customView.frame.height
            )
        )
        activity.startAnimating()
        activity.color = .init { (trait) -> UIColor in
            return trait.userInterfaceStyle == .dark ? .white : .black
        }
        customView.addSubview(activity)
    }

    func dismissCustom() {
        window?.isUserInteractionEnabled = true
        customView?.removeFromSuperview()
    }
}

