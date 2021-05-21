//
//  PersonListTableViewController.swift
//  PairRandomizerAssesment
//
//  Created by Jantsen Tanner on 5/21/21.
//

import UIKit

class PersonListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        randomizePersons()
        
    }
    @IBAction func addPersonButtonTapped(_ sender: Any) {
        addNewPersonAlertController()
    }
    func addNewPersonAlertController() {
        let alertController = UIAlertController(title: "New Person", message: "add name", preferredStyle: .alert)
        alertController.addTextField { textTield in
            textTield.placeholder = "Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let newPerson = alertController.textFields?[0].text, !newPerson.isEmpty else {return}
            PersonController.sharedInstance.createPersonAndSaveWith(name: newPerson, group: Int.random(in: 1..<5))
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        present(alertController, animated: true)
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
        //PersonController.sharedInstance.persons.count / Int(2.rounded()+1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let personsArray = PersonController.sharedInstance.persons.filter { person in
            return person.group == section + 1
        }
        return personsArray.count
    }
    
    //[Joe.group = 5, Sally.group = 2, Jim.group = 2, Frank.group = 3]
    // [Sally.group = 2, Jim.group = 2]
    // indexPath.section = 2, indexPath.row = 0
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let personsArray = PersonController.sharedInstance.persons.filter { person in
            return person.group == indexPath.section + 1
        }
        let person = personsArray[indexPath.row]
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    func randomizePersons(){
        // this will be called in the randomizeButtonTapped function on the viewController
        
        
        
        
        PersonController.sharedInstance.savePersistenceStore()
    }
}
