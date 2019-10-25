//
//  GroupController.swift
//  Pairs
//
//  Created by Jordan Lamb on 10/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

class GroupController {
    
    // MARK: - Singleton
    static let shared = GroupController()
    
    // MARK: - Source Of Truth
    var groups: [Group] = []
    
    // MARK: - CRUD
    func createNewGroup() {
        let newGroupName = "Group \(groups.count + 1)"
        let newGroup = Group(groupName: newGroupName)
        groups.append(newGroup)
        saveToPersistentStore()
    }
    
    func addPeopleToGroup(person: Person, to group: Group, completion: @escaping (_ success: Bool) -> Void) {
        for person in PersonController.shared.people {
            if group.people.count > 2 {
                group.people.append(person)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    // MARK: - Persistance
    
    // FileURL
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "pairs.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    // Save
    func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonPairs = try jsonEncoder.encode(groups)
            try jsonPairs.write(to: fileURL())
        } catch let encodingError {
            print("There was an error encoding data: \(encodingError)")
        }
    }
    
    // Load
    func loadFromPersistentStore() {
        let jsonDecoder = JSONDecoder()
        do {
            let jsonData = try Data(contentsOf: fileURL())
            let decodedGroups = try jsonDecoder.decode([Group].self, from: jsonData)
            groups = decodedGroups
        } catch let decodingError {
            print("There was an error decoding data \(decodingError)")
        }
    }
}
