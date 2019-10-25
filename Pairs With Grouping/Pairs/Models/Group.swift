//
//  Groups.swift
//  Pairs
//
//  Created by Jordan Lamb on 10/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

class Group: Codable {
    let groupName: String
    var people: [Person]
    
    init(groupName: String, people: [Person] = []) {
        self.groupName = groupName
        self.people = people
    }
}
