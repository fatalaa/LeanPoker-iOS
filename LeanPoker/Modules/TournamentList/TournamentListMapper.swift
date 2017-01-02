//
//  TournamentListMapper.swift
//  LeanPoker
//
//  Created by Tibor Molnár on 2016. 12. 30..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import Foundation

protocol DataMapper {
    associatedtype ResponseModel
    associatedtype UIModel
    
    func map(inputModel: ResponseModel) -> UIModel?
}

struct TournamentListDataMapper: DataMapper {
    typealias ResponseModel = [TournamentResponseModel]
    typealias UIModel = TournamentListUIModel
    
    func map(inputModel: [TournamentResponseModel]) -> TournamentListUIModel? {
        return nil
    }
}

struct TournamentDataMapper: DataMapper {
    typealias ResponseModel = TournamentResponseModel
    typealias UIModel = TournamentUIModel

    func map(inputModel: TournamentResponseModel) -> TournamentUIModel? {
        return nil
    }
}
