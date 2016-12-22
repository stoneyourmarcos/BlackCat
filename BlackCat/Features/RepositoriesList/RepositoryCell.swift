import UIKit
import SDWebImage

class RepositoryCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var repositoryNameLbl: UILabel!
    @IBOutlet weak var repositoryDescriptionLbl: UILabel!
    @IBOutlet weak var repositoryForksCountLbl: UILabel!
    @IBOutlet weak var repositoryStarsCountLbl: UILabel!
    @IBOutlet weak var repositoryOwnerLoginLbl: UILabel!
    @IBOutlet weak var repositoryOwnerAvatarImg: UIImageView!
}

extension RepositoryCell {
    
    func config(withViewModel viewModel: RepositoryCellViewModel) {
        repositoryNameLbl.text = viewModel.name
        repositoryDescriptionLbl.text = viewModel.description
        repositoryForksCountLbl.text = "\(viewModel.forksCount)"
        repositoryStarsCountLbl.text = "\(viewModel.starsCount)"
        repositoryOwnerLoginLbl.text = viewModel.owner
        repositoryOwnerAvatarImg.sd_setImage(with: viewModel.avatarImageURL)
    }
}
