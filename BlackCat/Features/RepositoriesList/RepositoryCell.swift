//
//  RepoCell.swift
//  BlackCat
//
//  Created by Marcos Contente on 07/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoryCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var repoDescriptionLbl: UILabel!
    @IBOutlet weak var repoForksCountLbl: UILabel!
    @IBOutlet weak var repoStarsCountLbl: UILabel!
    @IBOutlet weak var ownerLoginLbl: UILabel!
    @IBOutlet weak var ownerAvatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
    
}

extension RepositoryCell {
    
    func configCell(forRepository repository: Repository) {
        
        repoNameLbl.text = repository.name
        repoDescriptionLbl.text = repository.description
        repoForksCountLbl.text = String(describing: repository.forks!)
        repoStarsCountLbl.text = String(describing: repository.stars!)
        ownerLoginLbl.text = ("\(repository.ownerLogin)")
        ownerAvatarImg.sd_setImage(with: URL(string: "\(repository.ownerAvatar)"))
    }
    
}
