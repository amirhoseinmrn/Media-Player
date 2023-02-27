//
//  BaseViewModel.swift
//
//  Created by Amir on 11/6/1399 AP.
//

import Foundation
import UIKit
import CoreData

enum BaseViewModelChange {
    case didSuccess
    case didError(Error)
    case cancel
    case didChangeNetworkActivityStatus(Bool)
}

public class BaseViewModel {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate   
}
