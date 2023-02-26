//
//  Images.swift
//  Media-Player
//
//  Created by amir on 2/27/23.
//

import UIKit

enum Images: String {
    case namavaLogo = "namava-logo"
    
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
