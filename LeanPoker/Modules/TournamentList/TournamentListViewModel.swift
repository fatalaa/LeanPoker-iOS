//
//  TournamentListViewModel.swift
//  LeanPoker
//
//  Created by Tibor Molnár on 2016. 12. 29..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import RxSwift
import UIKit

enum TournamentListMode: Int {
    case list = 0
    case map = 1
}

protocol TournamentListViewModelInterface {
    var listMode: Variable<TournamentListMode> {get set}
    var refreshHit: Variable<Bool> {get set}
    var tournaments: Observable<[TournamentResponseModel]>? {get set}
}

class TournamentListViewModel: TournamentListViewModelInterface {
    
    let view: TournamentListView
    
    let disposeBag = DisposeBag()
    
    let tournamentsUseCase: TournamentListUseCaseInterface
    
    var listMode: Variable<TournamentListMode> = Variable(.list)
    
    var refreshHit: Variable<Bool> = Variable(false)
    
    var tournaments: Observable<[TournamentResponseModel]>?
    
    init(with view: TournamentListView, useCase: TournamentListUseCaseInterface) {
        self.view = view
        self.tournamentsUseCase = useCase
        setupBindings()
    }
    
    private func setupBindings() {
        listMode
            .asObservable()
            .subscribe(onNext: { [weak self] (mode) in
                if let `self` = self {
                    switch mode {
                    case .list:
                        self.view.showList()
                    case .map:
                        self.view.showMap()
                        
                    }
                }
            })
            .addDisposableTo(disposeBag)
        
        refreshHit
            .asObservable()
            .subscribe(onNext: { [weak self] (refreshHit) in
                if let `self` = self, refreshHit {
                    self.tournaments = self.tournamentsUseCase.fetchTournaments()
                    if let tournaments = self.tournaments {
                        tournaments.subscribe(onNext: { [weak self] (response) in
                            print("Response: \(response)")
                        })
                        .addDisposableTo(self.disposeBag)
                    }
                }
            })
            .addDisposableTo(disposeBag)
    }
}
