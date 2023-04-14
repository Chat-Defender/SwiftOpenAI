//
//  File.swift
//  
//
//  Created by Rob Jonson on 23/03/2023.
//

import Foundation

public struct CDMessage {
    /// The key referencing your message in Chat Defender
    let key: String

    /// The variables for substitution into your message
    let variables: [String: String]?

    /// Creates a new CDMessage with a given key and variables
    /// - Parameters:
    ///   - key: key for message in ChatDefender
    ///   - variables: optional variables for substitution
    public init(key: String, variables: [String: String]? = nil) {
        self.key = key
        self.variables = variables
    }

    var jsonObject: [String: Any] {
        var dict = [String: Any]()
        dict["key"] = key
        if let variables {
            dict["variables"] = variables
        }
        return dict
    }
}

extension CDMessage: Equatable {

}
extension CDMessage: Hashable {

}
