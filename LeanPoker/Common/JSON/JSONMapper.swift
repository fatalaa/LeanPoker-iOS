//
// Created by Tibor Molnár on 2016. 12. 31..
// Copyright (c) 2016 LeanPoker.org. All rights reserved.
//

import Foundation
import ObjectMapper

protocol JSONMapping {
    associatedtype ResponseModel

    func mapArray(JSON: Any) -> [ResponseModel]?
    func map(JSON: Any) -> ResponseModel?
}

struct JSONMapper<T: Mappable>: JSONMapping {
    typealias ResponseModel = T

    func mapArray(JSON: Any) -> [ResponseModel]? {
        return Mapper<T>().mapArray(JSONObject: JSON)
    }

    func map(JSON: Any) -> T? {
        return Mapper<T>().map(JSONObject: JSON)
    }

}
