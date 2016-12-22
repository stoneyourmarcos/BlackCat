import Foundation
import Unbox

public struct Repository {
    
    //MARK: - Properties
    
    let name: String
    let description: String
    let stars: Int
    let forks: Int
    let ownerLogin: String
    let ownerAvatar: String
}

extension Repository: Unboxable {
    
    public init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.description = try unboxer.unbox(key: "description")
        self.stars = try unboxer.unbox(keyPath: "stargazers_count")
        self.forks = try unboxer.unbox(key: "forks_count")
        self.ownerLogin = try unboxer.unbox(keyPath: "owner.login")
        self.ownerAvatar = try unboxer.unbox(keyPath: "owner.avatar_url")
    }
}
