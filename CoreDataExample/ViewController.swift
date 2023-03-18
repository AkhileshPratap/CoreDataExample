//
//  ViewController.swift
//  CoreDataExample
//
//  Created by AkhileshSingh on 17/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createEmployee()
        fetchEmployee()
    }
    
    private func createEmployee() {
        let employee = Employee(context: PersistentStorage.shared.context)
        employee.name = "Akhilesh"
        PersistentStorage.shared.saveContext()
    }
    
    func fetchEmployee() {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint("file path \(path)")
        do {
            guard let results = try PersistentStorage.shared.context.fetch(Employee.fetchRequest()) as? [Employee] else { return }
            print("fetch employee results: \(results)")
            results.forEach({ debugPrint($0.name)})
        } catch (let error) {
            debugPrint(error)
        }
    }


}

