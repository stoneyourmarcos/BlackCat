//
//  RequePullRequestsViewController.swift
//  BlackCat
//
//  Created by Marcos Contente on 08/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import UIKit
import SafariServices

class PullRequestsViewController: UITableViewController {
    
    fileprivate var pullRequests: [PullRequest] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var ownerPullRequest: String?
    var repositoryPullRequest: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = repositoryPullRequest
        
        fetchPullReques()
    }
}
// MARK: - Table view data source

extension PullRequestsViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestsCell", for: indexPath) as! PullRequestCell

        let request = pullRequests[indexPath.row]
        
        cell.configCell(forPullRequest: request)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString: String = pullRequests[indexPath.row].pullRequestUrl
        if let url = URL(string: urlString) {
            let svc = SFSafariViewController(url: url)
            self.present(svc, animated: true, completion: nil)
        }
    }
}

extension PullRequestsViewController {
    
    func fetchPullReques(){
        guard let ownerPullRequest = ownerPullRequest, let repositoryPullRequest = repositoryPullRequest else { return }
        APIManager.fetchRepositoryPullRequests(owner: ownerPullRequest, repository: repositoryPullRequest).then { pullRequests -> Void in
            self.pullRequests = pullRequests
            } .catch { error in
                print(error)
        }
    }
}
