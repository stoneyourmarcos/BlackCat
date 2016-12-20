//
//  RequestsCell.swift
//  BlackCat
//
//  Created by Marcos Contente on 08/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import UIKit

class PullRequestCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var requestNameLbl: UILabel!
    @IBOutlet weak var requestDescriptionLbl: UILabel!
    @IBOutlet weak var requestPushedAtLbl: UILabel!
    @IBOutlet weak var ownerLoginLbl: UILabel!
    @IBOutlet weak var ownerAvatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
}

extension PullRequestCell {

    func configCell(forPullRequest pullRequest: PullRequest) {
        requestNameLbl.text = pullRequest.title
        requestDescriptionLbl.text = pullRequest.body
        requestPushedAtLbl.text = ("\(pullRequest.date)")
        ownerLoginLbl.text = ("\(pullRequest.ownerLogin)")
        ownerAvatarImg.setImageFromURl(stringImageUrl: ("\(pullRequest.ownerAvatar)"))
    }
}
