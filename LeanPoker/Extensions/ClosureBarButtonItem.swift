//
//  ClosureBarButtonItem.swift
//  LeanPoker
//
//  Created by Tibor Molnar on 2016. 12. 30..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import UIKit

final class ClosureBarButtonItem: UIBarButtonItem {
    
    var handler: ((ClosureBarButtonItem) -> ())?
    
    @objc private func handleTap() {
        handler?(self)
    }
    
    convenience init(barButtonSystemItem systemItem: UIBarButtonSystemItem, handler: ((ClosureBarButtonItem) -> ())?) {
        self.init(barButtonSystemItem: systemItem, target: nil, action: #selector(handleTap))
        self.target = self
        self.handler = handler
    }
}
