//
//  PersonController.swift
//  Pairs
//
//  Created by Jordan Lamb on 10/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

class PersonController {
    
    // MARK: - Singleton
    static let shared = PersonController()
    
    // MARK: - Source Of Truth
    var people: [Person] = []
    
    // MARK: - CRUD
    // Create
    func createPerson(fullName: String) {
        let newPerson = Person(fullName: fullName)
        people.append(newPerson)
    }
    
    // Delete
    func deletePerson(person: Person) {
        guard let personIndex = people.firstIndex(of: person) else { return }
        people.remove(at: personIndex)
    }
    
}

let mockPeople: [Person] = {
    
    let gregOstertag = Person(fullName: "Greg Ostertag")
    let jeffHornacek = Person(fullName: "Jeff Hornacek")
    let karlMalone = Person(fullName: "Karl Malone")
    let bryanRussell = Person(fullName: "Bryan Russell")
    let jerrySloan = Person(fullName: "Jerry Sloan")
    let johnStockton = Person(fullName: "John Stockton")
    let hotRodHundley = Person(fullName: "Hot Rod Hundley")
    
    return [gregOstertag, jeffHornacek, karlMalone, bryanRussell, jerrySloan, johnStockton, hotRodHundley]
}()
