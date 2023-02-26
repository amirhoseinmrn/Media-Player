//
//  Result.swift
//
//
//  Created by Amir on 11/6/1399 AP.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

public extension Result {
    var isSuccess: Bool {
        switch self {
        case .success(_):
            return true
        case .failure(_):
            return false
        }
    }
    
    var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure(_):
            return nil
        }
    }
    
    var error: Error? {
        switch self {
        case .success(_):
            return nil
        case .failure(let error):
            return error
        }
    }
}

public extension Result {
    func map<T>(_ transform: (Value) -> T) -> Result<T> {
        switch self {
        case .success(let value):
            let newValue = transform(value)
            return Result<T>.success(newValue)
        case .failure(let error):
            return Result<T>.failure(error)
        }
    }
    
    func flatMap<T>(_ transform: (Value) -> Result<T>) -> Result<T> {
        switch self {
        case .success(let value):
            return transform(value)
        case .failure(let error):
            return Result<T>.failure(error)
        }
    }
}
