import UIKit
import PromiseKit

class RepositoryViewController: UITableViewController {
    
    fileprivate var repositories: [Repository] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRepositories()
    }
}

// MARK - TableView Data Source

extension RepositoryViewController {
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepositoryCell
        let repository = repositories[indexPath.row]
        cell.config(withViewModel: RepositoryCellViewModel(withRepository: repository))
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let destination = segue.destination as? PullRequestsViewController else { return }
        let owner = repositories[indexPath.row].ownerLogin
        let repository = repositories[indexPath.row].name
        destination.ownerPullRequest = owner
        destination.repositoryPullRequest = repository
    }
}

// MARK - Data Fetching

extension RepositoryViewController {
    func fetchRepositories() {
        APIManager.fetchJavaRepositories().then { repositories -> Void in
            self.repositories = repositories
            }.catch { error in
                print(error)
        }
    }
}
