//
//  HomeTableViewCell.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFont()
        setupColor()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(data: VideoModel) {
        titleLabel.text = data.name
        descriptionLabel.text = data.description
        let url = data.pictures?.baseLink ?? ""
        thumbnailImageView.sd_setImage(with: URL(string: url),
                                       placeholderImage: Images.namavaLogo.image)
    }
    
    func setupFont() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
    }
    
    func setupColor() {
        titleLabel.textColor = UIColor.label
        descriptionLabel.textColor = UIColor.secondaryLabel
    }
    
    func setupUI() {
        thumbnailImageView.layer.borderWidth = BorderStyles.defaultBorderWidth.rawValue
        thumbnailImageView.layer.borderColor = UIColor.secondarySystemBackground.withAlphaComponent(0.8).cgColor
        thumbnailImageView.layer.cornerRadius = BorderStyles.defaultCornerRadius.rawValue
    }
}

extension HomeTableViewCell {
    class func register(for tableView: UITableView) {
        tableView.register(UINib(nibName: self.nameOfClass, bundle: Bundle.main),
                           forCellReuseIdentifier: self.nameOfClass)
    }
}
