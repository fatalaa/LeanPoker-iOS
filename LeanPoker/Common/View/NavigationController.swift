//
//  NavigationController.swift
//  LeanPoker
//
//  Created by Tibor Molnár on 2016. 11. 15..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return viewControllers.last?.preferredStatusBarStyle ?? .lightContent
        }
    }

}
