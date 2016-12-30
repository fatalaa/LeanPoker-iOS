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
    func fetchTournaments() -> Observable<(HTTPURLResponse,Data)>
}

struct TournamentListUseCase: TournamentListUseCaseInterface {
    private let httpClient: Networking
    
    init(with httpClient: Networking) {
        self.httpClient = httpClient
    }
    
    func fetchTournaments() -> Observable<(HTTPURLResponse, Data)> {
        return httpClient.get(path: "tournament")
    }
}


