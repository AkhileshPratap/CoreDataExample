//
//  EmployeeManager.swift
//  CoreDataExample
//
//  Created by AkhileshSingh on 18/03/23.
//

import Foundation

struct EmployeeManager {
    private let repository = EmployeeDataRepository()
    
    func create(employee: Employee) {
        repository.create(employee: employee)
    }
    
    func getAll() -> [Employee]? {
        repository.getAll()
    }
    
    func get(byIndentifier id: UUID) -> Employee? {
        repository.get(byIndentifier: id)
    }
    
    func update(employee: Employee) -> Bool {
        return repository.update(employee: employee)
    }
    
    func delete(employee: Employee) -> Bool {
        return repository.delete(employee: employee)
    }
}
