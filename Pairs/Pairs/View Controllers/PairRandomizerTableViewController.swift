//
//  PairRandomizerTableViewController.swift
//  Pairs
//
//  Created by Jordan Lamb on 10/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class PairRandomizerTableViewController: UITableViewController {
    
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonController.shared.people.count
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
    func updateDesign() {
        randomizeButton.layer.cornerRadius = randomizeButton.frame.height / 4
    }
    
}
