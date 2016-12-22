import Foundation
import Unbox

public struct PullRequest {
    
    //MARK: - Properties

    let title: String
    let body: String
    let updatedAt: Date
    let login: String
    let avatar: String
    let pullRequestURL: String
}

extension PullRequest: Unboxable {
    
    public init(unboxer: Unboxer) throws {
        self.title = try unboxer.unbox(key: "title")
        self.body = try unboxer.unbox(keyPath: "body")
        self.login = try unboxer.unbox(keyPath: "user.login")
        self.avatar = try unboxer.unbox(keyPath: "user.avatar_url")
        self.pullRequestURL = try unboxer.unbox(key: "html_url")
        
        //Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        self.updatedAt = try unboxer.unbox(key: "updated_at", formatter: dateFormatter)
    }
}
