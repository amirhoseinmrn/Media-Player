//
//  BaseHomeCell.swift
//  Media-Player
//
//  Created by amir on 2/28/23.
//

import UIKit

protocol BaseHomeCellProtocol {
    func config(data: VideoModel)
}

class BaseHomeCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(data: VideoModel) {}
}
