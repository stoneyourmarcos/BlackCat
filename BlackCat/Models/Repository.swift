//
//  Repositories.swift
//  BlackCat
//
//  Created by Marcos Contente on 07/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import Foundation
import Unbox

public struct Repository {
    let name: String
    let description: String?
    let owner: String
    let ownerLogin: String?
    let ownerAvatar: String?
    let stars: Int?
    let forks: Int?
}

extension Repository: Unboxable {
    
    public init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.description = unboxer.unbox(key: "description")
        self.owner = try unboxer.unbox(key: "owner")
        self.ownerLogin = unboxer.unbox(key: "owner.login")
        self.ownerAvatar = unboxer.unbox(key: "owner.avatar_url")
        self.stars = unboxer.unbox(keyPath: "stargazers_count")
        self.forks = unboxer.unbox(key: "forks_count")
    }
}
