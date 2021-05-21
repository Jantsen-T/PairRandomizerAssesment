//
//  PersonError.swift
//  PairRandomizerAssesment
//
//  Created by Jantsen Tanner on 5/21/21.
//

import Foundation
enum PersonError: LocalizedError {
    case ckError(Error)
    case couldNotUnwrap
    case unexpectedRecordsFound
    
    var errorDescription: String? {
        switch self {
        case .ckError(let error):
            return "There was an error -- \(error) -- \(error.localizedDescription)."
        case .couldNotUnwrap:
            return "There was an error unwrapping the Yak."
        case .unexpectedRecordsFound:
            return "There were unexpected records found on CloudKit"
        }
    }
}
