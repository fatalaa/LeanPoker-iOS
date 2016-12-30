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
    var listModel: Variable<TournamentListMode> {get set}
}

class TournamentListViewModel: TournamentListViewModelInterface {
    
    let view: TournamentListView
    
    var listModel: Variable<TournamentListMode> = Variable(.list)
    
    init(with view: TournamentListView) {
        self.view = view
    }
}
