//
//  BaseService.swift
//
//  Created by Amir 
//

import Foundation
import Alamofire

public class BaseService {
    var header: HTTPHeaders {
        return HTTPHeaders([
            "Authorization": "bearer 1cd16c427881323a22f092cfb6dbceaf"
        ])
    }
    
    func checkErrorMessage(_ response: AFDataResponse<Data>, error: Error) -> Error {
        let statusCode = error.asAFError?.responseCode ?? -1
        return NSError(domain: error.localizedDescription, code: statusCode, userInfo: nil)
    }
}
