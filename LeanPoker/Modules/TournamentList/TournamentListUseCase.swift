//
//  TournamentListUseCase.swift
//  LeanPoker
//
//  Created by Tibor Molnar on 2016. 12. 30..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import Foundation
import RxSwift

protocol TournamentListUseCaseInterface {
    func fetchTournaments() -> Observable<[TournamentResponseModel]>
}

typealias TournamentListJSONMapper = JSONMapper<TournamentResponseModel>

class TournamentListUseCase: TournamentListUseCaseInterface {
    
    private let httpClient: Networking
    
    private let jsonMapper = TournamentListJSONMapper()
    
    init(with httpClient: Networking) {
        self.httpClient = httpClient
    }
    
    func fetchTournaments() -> Observable<[TournamentResponseModel]> {
        return httpClient
            .get(path: "tournament")
            .map({ [weak self] (response) -> [TournamentResponseModel] in
                if let `self` = self, let result = self.jsonMapper.mapArray(JSON: response) {
                    return result
                } else {
                    return []
                }
            })
    }
}


