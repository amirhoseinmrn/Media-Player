//
//  Extensions.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation

extension NSObject {
    @objc static var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
