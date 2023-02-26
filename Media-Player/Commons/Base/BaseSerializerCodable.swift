//
//  BaseSerializer.swift
//
//  Created by amir
//

import Foundation

class BaseSerializer {
    enum Error: Swift.Error {
        case invalidResponse
    }
    
    static let shared = BaseSerializer()
    
    func serialize<T: Codable>(data: Data) -> Result<T> {
        let response = try? JSONDecoder().decode(T.self, from: data)
        guard let response = response else {
            let result = Result<T>.failure(Error.invalidResponse)
            return result
        }
        return Result<T>.success(response)
    }
    
    func paginableSerialize<T: Codable>(data: Data) -> Result<Paginable<T>> {
        guard let response = try? JSONDecoder().decode(Paginable<T>.self, from: data) else {
            return Result<Paginable<T>>.failure(Error.invalidResponse)
        }
        return Result<Paginable<T>>.success(response)
    }
}
