//
//  MethodType.swift
//  CarListing
//
//  Created by Poonam on 14/12/21.
//

import Foundation

enum MethodType : String {
    case getmethod = "GET"
    case postmethod = "POST"
    
}


enum CustomError: Error {
    case noInternetConnection
    case failedToParse
}


extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return NSLocalizedString("Please check internet connection on your device", comment: "No Network Connection")
        case .failedToParse:
            return NSLocalizedString("Failed to parse the json", comment: "Parsing Failed")
        }
    }
}

