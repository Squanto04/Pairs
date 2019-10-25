//
//  AlertHelper.swift
//  Pairs
//
//  Created by Jordan Lamb on 10/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

extension PairRandomizerTableViewController {
    
    func newPersonAlert() {
        var newNameTextField: UITextField?
        let alert = UIAlertController(title: "Add Person", message: "Add someone new to the list!", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Full Name"
            newNameTextField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let newName = newNameTextField?.text,
                !newName.isEmpty
                else { return }
            
            PersonController.shared.createPerson(fullName: newName)
            GroupController.shared.addPeopleToGroup(person: Person, to: <#T##Group#>, completion: <#T##(Bool) -> Void#>)
            
            self.tableView.reloadData()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true)
    }
}
