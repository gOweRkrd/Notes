//
//  Extension+CoreData.swift
//  Notes
//
//  Created by Александр Косяков on 23.12.2022.
//

import UIKit
import CoreData

extension MainViewController {
    
    func saveTask (taskToDo: String) {
        
        guard taskToDo != "" else { return }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Task
        
        taskObject.taskToDo = taskToDo
        
        do {
            try context.save()
            notesItems.insert(taskObject, at: 0)
            print("Saved!Good Job!")
        } catch {
            print(error.localizedDescription)
        }
    }
}
