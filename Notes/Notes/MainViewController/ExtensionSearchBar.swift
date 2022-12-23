//
//  ExtensionSearchBar.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit
import CoreData

extension MainViewController: UISearchBarDelegate, UISearchDisplayDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            var predicate: NSPredicate = NSPredicate()
            predicate = NSPredicate(format: "name contains[c] '\(searchText)'")
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedObjectContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Contact")
            fetchRequest.predicate = predicate
            do {
                notesItems = try managedObjectContext.fetch(fetchRequest) as! [Task]
            } catch let error as NSError {
                print("Could not fetch. \(error)")
            }
        }
        myTableView.reloadData()
    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredData = []
//
//        if searchText == "" {
//            filteredData = items
//        }
//
//            for word in items {
//
//                if word.uppercased().contains(searchText.uppercased()) {
//                    filteredData.append(word)
//
//                }
//
//            }
//
////        self.tableView.reloadData()
//        }
    }

