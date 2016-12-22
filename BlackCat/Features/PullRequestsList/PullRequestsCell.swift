import UIKit
import SDWebImage

class PullRequestCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var pullRequestTitleLbl: UILabel!
    @IBOutlet weak var pullRequestBodyLbl: UILabel!
    @IBOutlet weak var pullRequestUpdatedAtLbl: UILabel!
    @IBOutlet weak var pullRequestOwnerLoginLbl: UILabel!
    @IBOutlet weak var pullRequestOwnerAvatarImg: UIImageView!
    
}

extension PullRequestCell {

    func config(withViewModel viewModel: PullRequestCellViewModel) {
        pullRequestTitleLbl.text = viewModel.title
        pullRequestBodyLbl.text = viewModel.body
        pullRequestUpdatedAtLbl.text = viewModel.updatedAt
        pullRequestOwnerLoginLbl.text = viewModel.login
        pullRequestOwnerAvatarImg.sd_setImage(with: viewModel.avatarImageURL)
    }
}
