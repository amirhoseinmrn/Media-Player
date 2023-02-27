//
//  Extensions.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation
import UIKit

extension NSObject {
    @objc static var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0,
                                                 width: self.bounds.size.width,
                                                 height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .secondaryLabel
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
