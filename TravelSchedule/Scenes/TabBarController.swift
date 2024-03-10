//
//  TabBarController.swift
//  TravelSchedule
//
//  Created by Ognerub on 3/9/24.
//

import UIKit

final class TabBarController: UITabBarController {
    private let scheduleTabBarItem = UITabBarItem(
        title: "",
        image: UIImage.scheduleTabIcon,
        tag: 0
    )
    private let settingsTabBarItem = UITabBarItem(
        title: "",
        image: UIImage.settingsTabIcon,
        tag: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sheduleViewController = UINavigationController(
            rootViewController:
                SheduleViewController()
        )
        sheduleViewController.tabBarItem = scheduleTabBarItem
        
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = settingsTabBarItem
        
        viewControllers = [
            sheduleViewController,
            settingsViewController
        ]
        selectedIndex = 0
        
        view.backgroundColor = UIColor.whiteDay
        tabBar.backgroundColor = UIColor.whiteDay
        tabBar.tintColor = UIColor.blackDay
        tabBar.unselectedItemTintColor = UIColor.greyUniversal
        addTopBorder(for: tabBar, with: .greyUniversal, andWidth: 1)
    }
    
    private func addTopBorder(for view: UIView, with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: borderWidth)
        view.addSubview(border)
    }
}

