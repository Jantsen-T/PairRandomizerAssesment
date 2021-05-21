//
//  PersonController.swift
//  PairRandomizerAssesment
//
//  Created by Jantsen Tanner on 5/21/21.
//

import UIKit

class PersonController {
    static let sharedInstance = PersonController()
    
 var persons: [Person] = []
    
    //MARK: - Persistence
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Person.json")
        return fileURL
    }
    func savePersistenceStore() {
        do {
            let data = try JSONEncoder().encode(persons)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
        
    }
    func loadFromPresistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            persons = try JSONDecoder().decode([Person].self, from: data)
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            
        }
        
    }

//    //MARK: - CRUD
    func createPersonAndSaveWith(name: String, group: Int) {
        let newPerson = Person(name: name, group: group)
        persons.append(newPerson)
        savePersistenceStore()
    
   }
    static func deletePerson(person: Person) {
       
    }
    static func update(person: Person, name: String) {
        person.name = name
       
    }

    

}// End of class

