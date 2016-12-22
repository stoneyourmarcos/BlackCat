import Foundation

struct RepositoryCellViewModel {
    let name: String?
    let description: String?
    let forksCount: Int?
    let starsCount: Int?
    let owner: String?
    let avatarImageURL: URL?
    
    init(withRepository repository: Repository) {
        name = repository.name
        description = repository.description
        forksCount = repository.forks
        starsCount = repository.stars
        owner = repository.ownerLogin
        avatarImageURL = URL(string: "\(repository.ownerAvatar)")!
    }
}
