//
//  APIProvider.swift
//  BlackCat
//
//  Created by Marcos Contente on 05/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import Foundation
import Moya

// MARK: Provider Setup

let endpointClosure = { (target: WebService) -> Endpoint<WebService> in
    let url: String = target.baseURL.appendingPathComponent(target.path).absoluteString
    let endpoint: Endpoint<WebService> =
        Endpoint<WebService>(url: url,
                             sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                             method: target.method,
                             parameters: target.parameters,
                             httpHeaderFields: [
                                "Content-Type": "application/json",
                                "Accept": "application/json"
                            ])
    return endpoint.adding(newHTTPHeaderFields: ["Accept": "application/vnd.github.v3+json"])
}

let requestClosure = { (endpoint: Endpoint<WebService>, done: MoyaProvider.RequestResultClosure) in
    var request = endpoint.urlRequest! as URLRequest
    done(.success(request))
}

let apiProvider = MoyaProvider<WebService>(
    endpointClosure: endpointClosure,
    requestClosure: requestClosure)
