//
//  RequestsViewController.swift
//  JavaHub
//
//  Created by Marcos Contente on 08/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import UIKit

class RequestsViewController: UITableViewController {
    
    fileprivate var requests: [Requests] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleRepos()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestsCell", for: indexPath) as! RequestsCell

        let request = requests[indexPath.row]
        
        cell.requestNameLbl.text = request.title
        cell.requestDescriptionLbl.text = request.body
        cell.requestPushedAtLbl.text = request.date
        cell.ownerLoginLbl.text = request.ownerLogin

        return cell
    }

}

extension RequestsViewController {
    
    func loadSampleRepos() {
        let req1 = Requests(owner: "java", ownerLogin: "java the cat", ownerAvatar: nil, title: "the cat", date: "11/11/11", body: "house of the cats", repository: [], ownerRepos: [], url: "house")
        
        let req2 = Requests(owner: "seth", ownerLogin: "java the cat", ownerAvatar: nil, title: "the cat", date: "11/11/11", body: "house of the cats", repository: [], ownerRepos: [], url: "house")
        
        let req3 = Requests(owner: "neftis", ownerLogin: "java the cat", ownerAvatar: nil, title: "the cat", date: "11/11/11", body: "house of the cats", repository: [], ownerRepos: [], url: "house")
        
        requests = [req1, req2, req3]
    }
}
