//
//  Person.swift
//  Pairs
//
//  Created by Jordan Lamb on 10/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

class Person: Codable {
    let fullName: String
    
    init(fullName: String) {
        self.fullName = fullName
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs === rhs
    }
}
