//
//  Requests.swift
//  BlackCat
//
//  Created by Marcos Contente on 07/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import Foundation
import Unbox

public struct PullRequest {
    let id: String?
    let title: String?
    let date: String
    let body: String?
    let ownerLogin: String
    let ownerAvatar: String
    let pullRequestUrl: String
}

extension PullRequest: Unboxable {
    
    public init(unboxer: Unboxer) throws {
        self.id = unboxer.unbox(key: "id")
        self.title = unboxer.unbox(key: "title")
        self.date = try unboxer.unbox(key: "updated_at")
        self.body = unboxer.unbox(keyPath: "body")
        self.ownerLogin = try unboxer.unbox(keyPath: "user.login")
        self.ownerAvatar = try unboxer.unbox(keyPath: "user.avatar_url")
        self.pullRequestUrl = try unboxer.unbox(key: "html_url")
    }
}
