//
//  APIManager.swift
//  BlackCat
//
//  Created by Marcos Contente on 05/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import Foundation
import Moya
import PromiseKit
import Unbox
import SwiftyJSON

public class APIManager {}

extension APIManager {
    
    public class func fetchJavaRepositories() -> Promise<[Repository]> {
        
        return Promise { fulfill, reject in
            apiProvider.request(.fetchJavaRepositories) { result in
                switch result {
                case let .success(response):
                    do {
                        print("status code: \(response.statusCode)")
                        debugPrint(JSON(response.data));
                        let repository : [Repository] = try unbox(data: response.data)
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


