//
//  RepoViewController.swift
//  BlackCat
//
//  Created by Marcos Contente on 05/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import UIKit
import PromiseKit

class RepositoryViewController: UITableViewController {
    
    fileprivate var repositories: [Repository] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        APIManager.fetchJavaRepositories().then { repositories -> Void in
            self.repositories = repositories
        }.catch { error in
            print(error)
        }
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
        
        cell.configCell(forRepository: repository)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        if let destination = segue.destination as? PullRequestsViewController {
            let owner = repositories[indexPath.row].ownerLogin
            let repository = repositories[indexPath.row].name
            destination.ownerPullRequest = owner
            destination.repositoryPullRequest = repository
        }
    }
}
