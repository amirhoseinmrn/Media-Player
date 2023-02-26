//
//  BaseSerializerCodable.swift
//
//  Created by amir
//

import Foundation

class BaseSerializerCodable {
    enum Error: Swift.Error {
        case invalidResponse
    }
    
    static let shared = BaseSerializerCodable()
    
    func serialize<T: Codable>(data: Data) -> Result<T> {
        let response = try? JSONDecoder().decode(T.self, from: data)
        guard let response = response else {
            let result = Result<T>.failure(Error.invalidResponse)
            return result
        }
        return Result<T>.success(response)
    }
}
