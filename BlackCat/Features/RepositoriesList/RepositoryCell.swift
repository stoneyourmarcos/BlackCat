//
//  RepoCell.swift
//  JavaHub
//
//  Created by Marcos Contente on 07/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var repoDescriptionLbl: UILabel!
    @IBOutlet weak var repoForksCountLbl: UILabel!
    @IBOutlet weak var repoStarsCountLbl: UILabel!
    @IBOutlet weak var ownerLoginLbl: UILabel!
    @IBOutlet weak var ownerAvatarLbl: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
    
}

