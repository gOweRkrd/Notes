//
//  Extension+CoreData.swift
//  Notes
//
//  Created by Александр Косяков on 23.12.2022.
//

import UIKit
import CoreData

struct ListModel {

    // MARK: - Properties
    
    var notesItems: [Task] = []
    var task: Task!
    var searchText: String = ""
    
    var filteredData: [Task] {
        return notesItems.filter({
            $0.taskToDo!.lowercased().starts(with: searchText) ||
            searchText.isEmpty
        })
    }
    
    // MARK: - Public Methods
    
    mutating func saveTask (taskToDo: String) {
        
        guard taskToDo != "" else { return }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Task
        
        taskObject.taskToDo = taskToDo
        
        do {
            try context.save()
            self.notesItems.insert(taskObject, at: 0)
            print("Saved!Good Job!")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    mutating func delete(_ myNotes: NSManagedObject, at indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        context.delete(myNotes)
        try? context.save()
        self.notesItems.remove(at: indexPath.row)
    }
}
