//
//  Requests.swift
//  BlackCat
//
//  Created by Marcos Contente on 07/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import Foundation
import Unbox

public struct Requests {
    let owner: String
    let ownerLogin: String
    let ownerAvatar: String?
    let title: String?
    let date: String
    let body: String?
    let repository: [Repository]
    let ownerRepos: [Repository]
    let url: String
}

extension Requests: Unboxable {
    
    public init(unboxer: Unboxer) throws {
        self.owner = try unboxer.unbox(key: "owner")
        self.ownerLogin = try unboxer.unbox(key: "owner.login")
        self.ownerAvatar = unboxer.unbox(key: "owner.avatar_url")
        self.title = unboxer.unbox(key: "name")
        self.date = try unboxer.unbox(key: "pushed_at")
        self.body = unboxer.unbox(keyPath: "description")
        self.repository = try unboxer.unbox(key: "owner.repos_url")
        self.ownerRepos = try unboxer.unbox(key: "owner.repos_url")
        self.url = try unboxer.unbox(key: "owner.html_url")
    }
}
