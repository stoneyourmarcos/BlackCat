//
//  NetworkManager.swift
//  BlackCat
//
//  Created by Marcos Contente on 05/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import Foundation
import Moya
import Sugar

enum NetworkManager {
    case fetchJavaRepositories
    case fetchRepositoryPullRequests(owner: String, repository: String)
}

extension NetworkManager: TargetType {
    var baseURL: URL { return URL(string: "https://api.github.com")!}
    
    var path: String {
        switch  self {
        case .fetchJavaRepositories:
            return "/search/repositories?q=language:Java&sort=stars&?page"
        case .fetchRepositoryPullRequests(let owner, let repository):
            return "/repos/\(owner)/\(repository)/pulls"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .request
    }
}

// MARK: - Helpers
public extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
