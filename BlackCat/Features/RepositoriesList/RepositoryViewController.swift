//
//  RepoViewController.swift
//  BlackCat
//
//  Created by Marcos Contente on 05/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import UIKit

class RepositoryViewController: UITableViewController {
    
    fileprivate var repositories: [Repository] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        loadSampleRepos()
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
        
        cell.repoNameLbl.text = repository.name
        cell.repoDescriptionLbl.text = repository.description
        cell.repoForksCountLbl.text = String(describing: repository.forks!)
        cell.repoStarsCountLbl.text = String(describing: repository.stars!)
        cell.ownerLoginLbl.text = repository.ownerLogin
        
        return cell
    }
}

extension RepositoryViewController {
    
    public func setupRepositories(_ repository: Repository, closure: @escaping () -> Void) {
//        RepoCell.repoNameLbl.text = repository.name
//        RepoCell.repoDescriptionLbl.text = repository.description
//        RepoCell.repoForksCountLbl.text = String(describing: repository.forks!)
//        repoStarsCountLbl.text = String(describing: repository.stars!)
//        ownerLoginLbl.text = repository.ownerLogin
//        if let url = URL(string: repository.ownerAvatar!) {
//            if let data = NSData(contentsOf: url) {
//                cell.imageView?.image = UIImage(data: data as Data)
//            }
//        }
    }
    
    func loadSampleRepos() {
        let repo1 = Repository(name: "java", description: "the cat", owner: "house", ownerLogin: "bong", ownerAvatar: nil, stars: 55, forks: 43)
        
        let repo2 = Repository(name: "seth", description: "the cat", owner: "house", ownerLogin: "bong", ownerAvatar: nil, stars: 55, forks: 43)
        
        let repo3 = Repository(name: "shanti", description: "the cat", owner: "house", ownerLogin: "bong", ownerAvatar: nil, stars: 55, forks: 43)
        
        let repo4 = Repository(name: "neftis", description: "the cat", owner: "house", ownerLogin: "bong", ownerAvatar: nil, stars: 55, forks: 43)
        
        repositories = [repo1, repo2, repo3, repo4]
    }

}

extension RepositoryViewController {
//    
//    fileprivate func selectRequest(_ repository: Requests) {
//        print("selecting Request \(repository.repository)")
//        APIManager.acceptSchedule(schedule).then { () -> Void in
//            log.info("Accepted")
//            self.fetchingData = false
//            }.catch { error in
//                log.error(error)
//                self.fetchingData = false
//        }
//    }
    
}

