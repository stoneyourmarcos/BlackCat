//
//  RequestsCell.swift
//  BlackCat
//
//  Created by Marcos Contente on 08/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import UIKit

class RequestsCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var requestNameLbl: UILabel!
    @IBOutlet weak var requestDescriptionLbl: UILabel!
    @IBOutlet weak var requestPushedAtLbl: UILabel!
    @IBOutlet weak var ownerLoginLbl: UILabel!
    @IBOutlet weak var ownerAvatarLbl: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
    
}
