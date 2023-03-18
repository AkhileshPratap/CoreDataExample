//
//  CDEmployee+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by AkhileshSingh on 18/03/23.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var email: String?
    @NSManaged public var profilePic: Data?
    
    func convertToEmployee()-> Employee {
        return Employee(id: self.id!, name: self.name, email: self.email, profilePic: self.profilePic)
    }

}

extension CDEmployee : Identifiable {

}
