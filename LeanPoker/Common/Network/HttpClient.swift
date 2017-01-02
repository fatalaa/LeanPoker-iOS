//
//  HttpClient.swift
//  LeanPoker
//
//  Created by Tibor Molnar on 2016. 12. 30..
//  Copyright © 2016. LeanPoker.org. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol Networking {
    func get(path: String) -> Observable<Any>
}

struct HttpClient {
    
    fileprivate let baseURL: String
    fileprivate let session: URLSession
    
    init(with baseURL: String, session: URLSession) {
        self.baseURL = baseURL
        self.session = session
    }
}

extension HttpClient: Networking {
    func get(path: String) -> Observable<Any> {
        guard let url = URL(string: "\(baseURL)/\(path)") else {
            return Observable.error(RxCocoaURLError.unknown)
        }
        let request = URLRequest(url: url)
        return session.rx.json(request: request)
    }
}
