//
//  Transforms.swift
//  LeanPoker
//
//  Created by Tibor Molnár on 2016. 12. 31..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import Foundation
import ObjectMapper

final class StringToDoubleTransform: TransformType {
    typealias JSON = String
    typealias Object = Double
    
    func transformFromJSON(_ value: Any?) -> Double? {
        if let value = value as? String {
            let number = NumberFormatter().number(from: value)
            let doubleNumber = number?.doubleValue
            return doubleNumber
        }
        return nil
    }
    
    func transformToJSON(_ value: Double?) -> String? {
        if let value = value {
            return "\(value)"
        }
        return nil
    }
}
