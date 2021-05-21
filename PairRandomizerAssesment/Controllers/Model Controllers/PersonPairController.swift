////
////  PersonPairController.swift
////  PairRandomizerAssesment
////
////  Created by Jantsen Tanner on 5/21/21.
////
//
//import Foundation
//class PersonPairController {
//    
//    static let sharedInstance = PersonPairController()
//    
//    var personPairs: [Person] = []
//    
//    
//    func delete(person: Person) {
//        guard let index = personPairs.firstIndex(of: person) else { return }
//        personPairs.remove(at: index)
//        savePersistenceStore()
//
//    }
//    
//    func addPersonTo(personPair: PersonPair, person: Person) {
//        personPair.pairs.append(person)
//        savePersistenceStore()
//    }
//    
//    func removePersonFrom(personPair: PersonPair, person: Person) {
//        guard let index = personPair.pairs.firstIndex(of: person) else {return}
//        personPair.pairs.remove(at: index)
//        savePersistenceStore()
//    }
//
//
//     //MARK: - Persistence
//    func createPersistenceStore() -> URL {
//        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let fileURL = url[0].appendingPathComponent("Person.json")
//        return fileURL
//    }
//    func savePersistenceStore() {
//        do {
//            let data = try JSONEncoder().encode(personPairs)
//            try data.write(to: createPersistenceStore())
//        } catch {
//            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
//        }
//
//    }
//
//    func loadFromPresistenceStore() {
//        do {
//            let data = try Data(contentsOf: createPersistenceStore())
//            let persons = try JSONDecoder().decode([Person].self, from: data)
//            self.personPairs = persons
//        } catch {
//            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
//
//        }
//
//    }
//
//    
//}
