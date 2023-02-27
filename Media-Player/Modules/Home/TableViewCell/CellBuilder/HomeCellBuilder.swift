//
//  HomeCellBuilder.swift
//  Media-Player
//
//  Created by amir on 2/28/23.
//

import Foundation
import UIKit

enum HomeCellType {
    case video
}

class HomeCellBuilder {
    func build(type: HomeCellType, tableView: UITableView, indexPath: IndexPath) -> BaseHomeCell {
        var cell: BaseHomeCell?
        switch type {
        case .video:
            cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.nameOfClass,
                                                 for: indexPath) as? HomeTableViewCell
        }
        return cell ?? BaseHomeCell()
    }
}
