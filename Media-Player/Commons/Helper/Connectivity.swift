//
//  Connectivity.swift
//
//
//  Created by Amir on 3/14/22.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
