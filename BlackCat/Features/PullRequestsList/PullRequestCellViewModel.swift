import Foundation

struct PullRequestCellViewModel {
    let title: String?
    let body: String?
    let updatedAt: String?
    let login: String
    let avatarImageURL: URL
    
    init(withPullRequest pullRequest: PullRequest) {
        title = pullRequest.title
        body = pullRequest.body
        updatedAt = pullRequest.updatedAt.ddmmyyyFormatted()
        login = pullRequest.login
        avatarImageURL = URL(string: "\(pullRequest.avatar)")!
    }
}
