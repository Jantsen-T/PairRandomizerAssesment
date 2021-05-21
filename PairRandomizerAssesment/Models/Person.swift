//
//  Person.swift
//  PairRandomizerAssesment
//
//  Created by Jantsen Tanner on 5/21/21.
//

import Foundation

class Person: Codable {
    //MARK: - Properties
    var name: String
    var group: Int
    
    init(name: String, group: Int){
        self.name = name
        self.group = group
    }
    
}// End of class

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}//end of extension

