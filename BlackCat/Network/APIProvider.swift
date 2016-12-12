//
//  APIProvider.swift
//  BlackCat
//
//  Created by Marcos Contente on 05/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import Foundation
import Moya
import Sugar

// MARK: Provider Setup

let endpointClosure = { (target: NetworkManager) -> Endpoint<NetworkManager> in
    let url: String = target.baseURL.appendingPathComponent(target.path).absoluteString
    let endpoint: Endpoint<NetworkManager> =
        Endpoint<NetworkManager>(url: url,
                             sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                             method: target.method,
                             parameters: target.parameters,
                             httpHeaderFields: [
                                "Content-Type": "application/json",
                                "Accept": "application/json"
                            ])
    debugPrint(url)
    debugPrint(endpoint)
    return endpoint
}

let requestClosure = { (endpoint: Endpoint<NetworkManager>, done: MoyaProvider.RequestResultClosure) in
    var request = endpoint.urlRequest! as URLRequest
    done(.success(request))
}

let apiProvider = MoyaProvider<NetworkManager>(
    endpointClosure: endpointClosure,
    requestClosure: requestClosure)
