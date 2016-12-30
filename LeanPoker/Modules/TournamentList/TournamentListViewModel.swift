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
}

class TournamentListViewModel: TournamentListViewModelInterface {
    
    let view: TournamentListView
    
    let disposeBag = DisposeBag()
    
    var listMode: Variable<TournamentListMode> = Variable(.list)
    
    var refreshHit: Variable<Bool> = Variable(false)
    
    init(with view: TournamentListView) {
        self.view = view
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
            .subscribe(onNext: { (refreshHit) in
                print("Refresh hit with value: \(refreshHit)")
            })
            .addDisposableTo(disposeBag)
    }
}
