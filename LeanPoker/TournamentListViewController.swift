//
//  ViewController.swift
//  LeanPoker
//
//  Created by Tibor Molnár on 2016. 11. 13..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

protocol TournamentListView {
    func showList()
    func showMap()
}

class TournamentListViewController: UIViewController, TournamentListView {
    
    private var viewModel: TournamentListViewModelInterface
    
    private let disposeBag = DisposeBag()
    
    fileprivate lazy var listSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["List", "Map"])
        control.tintColor = UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1)
        let selectedTitleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "OpenSans-Light", size: 12)
        ]
        control.setTitleTextAttributes(selectedTitleTextAttributes, for: .selected)
        let unSelectedTitleTextAttributes = [
            NSForegroundColorAttributeName: UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1),
            NSFontAttributeName: UIFont(name: "OpenSans-Light", size: 12)
        ]
        control.setTitleTextAttributes(unSelectedTitleTextAttributes, for: .normal)
        control.selectedSegmentIndex = 0
        return control
    }()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    init(with viewModel: TournamentListViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tournaments"
        view.backgroundColor = .white
        view.addSubview(listSegmentedControl)
        view.addSubview(containerView)
        setupConstraints()
        setupBindings()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    private func setupConstraints() {
        listSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            listSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            listSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            listSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            
            containerView.topAnchor.constraint(equalTo: listSegmentedControl.bottomAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupBindings() {
        listSegmentedControl
            .rx
            .value
            .asObservable()
            .subscribe(onNext: { [weak self] (newIndex) in
                if let `self` = self {
                    self.viewModel.listModel.value = TournamentListMode(rawValue: newIndex) ?? .list
                }
            })
            .addDisposableTo(disposeBag)
    }
    
    // MARK: TournamentListView
    
    func showList() {
        
    }
    
    func showMap() {
        
    }
}

