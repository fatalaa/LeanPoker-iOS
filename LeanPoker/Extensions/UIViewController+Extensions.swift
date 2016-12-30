//
//  UIViewController+Extensions.swift
//  LeanPoker
//
//  Created by Tibor Molnár on 2016. 11. 14..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import UIKit

extension UIViewController {
    func embedInNavigationController() -> NavigationController {
        let navigationViewController = NavigationController(rootViewController: self)
        return navigationViewController
    }
}
