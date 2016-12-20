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
    
    let id: Int
    let name: String // name == repository
    let fullName: String
    let description: String?
    let stars: Int?
    let forks: Int?
    let ownerLogin: String // ownerLogin == repositoryOwner
    let ownerAvatar: String
}

extension Repository: Unboxable {
    
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.name = try unboxer.unbox(key: "name")
        self.fullName = try unboxer.unbox(key: "full_name")
        self.description = unboxer.unbox(key: "description")
        self.stars = unboxer.unbox(keyPath: "stargazers_count")
        self.forks = unboxer.unbox(key: "forks_count")
        self.ownerLogin = try unboxer.unbox(keyPath: "owner.login")
        self.ownerAvatar = try unboxer.unbox(keyPath: "owner.avatar_url")
    }
}
