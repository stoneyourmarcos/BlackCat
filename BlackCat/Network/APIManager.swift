import Foundation
import Moya
import PromiseKit
import Unbox

public class APIManager {}

// MARK: - Repositories

extension APIManager {
    
    public class func fetchJavaRepositories() -> Promise<[Repository]> {
        
        return Promise { fulfill, reject in
            apiProvider.request(.fetchJavaRepositories()) { result in
                switch result {
                case let .success(response):
                    do {
                        let data = response.data
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                        let repository: [Repository] = try unbox(dictionary: json as! UnboxableDictionary, atKey: "items")
                        return fulfill(repository)
                    }
                    catch let error {
                        return reject(error)
                    }
                case .failure(_):
                    return reject(CaseError.linkError)
                }
            }
        }
    }
}

// MARK: - Repository Pull Requests

extension APIManager {

    public class func fetchRepositoryPullRequests(owner: String, repository: String) -> Promise<[PullRequest]> {
        
        return Promise { fulfill, reject in
            apiProvider.request(.fetchRepositoryPullRequests(owner: owner, repository: repository)) { result in
                switch result {
                case let .success(response):
                    let statusCode = response.statusCode
                    if (statusCode >= 200 && statusCode < 300) {
                        var pullRequests: [PullRequest]?
                        do {
                            pullRequests = try unbox(data: response.data)
                        } catch let error {
                            reject(error)
                            return
                        }
                        fulfill(pullRequests!)
                    }
                    else {
                        return reject(CaseError.failToParseResponse)
                    }
                case .failure(_): reject(CaseError.linkError)
                }
            }
        }
    }
}

// MARK: - Error

enum CaseError: Int, CustomStringConvertible, Swift.Error {
    case unknown = 0
    case linkError = 1
    case failToParseResponse = 2
    
    var description: String {
        switch self {
        case .unknown:
            return "Erro desconhecido"
        case .linkError:
            return "Falha de conexão, tente novamente"
        case .failToParseResponse:
            return "Falha ao parsear a resposta"
        }
    }
}


