//
//  PairRandomizerTableViewController.swift
//  Pairs
//
//  Created by Jordan Lamb on 10/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class PairRandomizerTableViewController: UITableViewController {
    
    // MARK: - Properties
    var allGroupsFull: Bool = true
    
    // MARK: - Outlets
    @IBOutlet weak var randomizeButton: UIButton!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
    }
    
    // MARK: - Actions
    @IBAction func addPersonButtonTapped(_ sender: Any) {
        newPersonAlert()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        PersonController.shared.people.shuffle()
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return GroupController.shared.groups.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupName = GroupController.shared.groups.first?.groupName
        return groupName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GroupController.shared.groups[0].people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pairsCell", for: indexPath)
        let person = PersonController.shared.people[indexPath.row]
        cell.textLabel?.text = person.fullName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let person = PersonController.shared.people[indexPath.row]
            PersonController.shared.deletePerson(person: person)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Helper Functions
    func checkFullGroups(groupName: String, person: Person) {
        for group in GroupController.shared.groups {
            if group.people.count > 2 {
                GroupController.shared.addPersonToGroup(person: person, to: group)
                allGroupsFull = false
            } else {
                allGroupsFull = true
            }
        }
    }
    
    func updateDesign() {
        randomizeButton.layer.cornerRadius = randomizeButton.frame.height / 4
    }
    
}
