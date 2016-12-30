//
//  TournamentMapViewController.swift
//  LeanPoker
//
//  Created by Tibor Molnar on 2016. 12. 30..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import MapKit
import UIKit

class TournamentMapViewController: UIViewController {
    
    fileprivate let mapView: MKMapView = MKMapView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        setupConstraints()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension TournamentMapViewController: MKMapViewDelegate {
}
