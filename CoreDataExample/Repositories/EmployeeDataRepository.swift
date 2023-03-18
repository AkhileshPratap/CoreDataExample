//
//  EmployeeDataRepository.swift
//  CoreDataExample
//
//  Created by AkhileshSingh on 18/03/23.
//

import Foundation
import CoreData

struct Employee {

    let id: UUID
    let name: String?
    let email: String?
    let profilePic: Data?
    
}

protocol EmployeeRepository {
    
    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIndentifier id: UUID) -> Employee?
    func update(employee: Employee) -> Bool
    func delete(employee: Employee) -> Bool
}

struct EmployeeDataRepository: EmployeeRepository {
    func create(employee: Employee) {
        let employee = CDEmployee(context: PersistentStorage.shared.context)
        employee.id = employee.id
        employee.name = employee.name
        employee.email = employee.email
        employee.profilePic = employee.profilePic
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        var employees: [Employee] = []
        
        result?.forEach({ cdEmployee in
            employees.append(cdEmployee.convertToEmployee())
        })
        return employees
    }
    
    func get(byIndentifier id: UUID) -> Employee? {
        guard let result = getCDEmployee(byIndentifier: id) else { return nil }
        return result.convertToEmployee()
    }
    
    func update(employee: Employee) -> Bool {
        guard let result = getCDEmployee(byIndentifier: employee.id) else { return false }
        
        result.id = employee.id
        result.name = employee.name
        result.email = employee.email
        result.profilePic = employee.profilePic
        
        PersistentStorage.shared.saveContext()
        
        return true
    }
    
    func delete(employee: Employee) -> Bool {
        guard let result = getCDEmployee(byIndentifier: employee.id) else { return false }
        
        PersistentStorage.shared.context.delete(result)
        return true
    }
    
    private func getCDEmployee(byIndentifier id: UUID) -> CDEmployee? {
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        do {
            guard let result = try PersistentStorage.shared.context.fetch(fetchRequest).first else { return nil }
            return result
        } catch (let error) {
            debugPrint(error)
            return nil
        }
    }
    
}
