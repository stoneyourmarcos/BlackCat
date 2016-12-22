import Foundation
import Moya

enum WebService {
    case fetchJavaRepositories()
    case fetchRepositoryPullRequests(owner: String, repository: String)
}

extension WebService: TargetType {
    var baseURL: URL { return URL(string: "https://api.github.com")!}
    
    var path: String {
        switch  self {
        case .fetchJavaRepositories:
            return "/search/repositories"
        case .fetchRepositoryPullRequests(let owner, let repository):
            return "/repos/\(owner)/\(repository)/pulls"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        switch self {
            case .fetchJavaRepositories:
                return ["q": "language:Java", "sort": "stars", "page": "1"]
            case .fetchRepositoryPullRequests:
                return nil
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .request
    }
}
