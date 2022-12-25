//
//  NotesViewController.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

class NotesViewController: UIViewController {
    
    // MARK: - Properties
    
    let notesView = NotesView()

    var task: Task!
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = notesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Your notes"
        
        let image = UIImage(systemName: "square.and.arrow.down")
        image?.withTintColor(.black)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(saveNotes))
        navigationItem.hidesBackButton = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setData()
    }
    
    // MARK: - Lifecycle
    
    @objc
    func saveNotes() {
        
        let nextScreen = ListViewController()
        self.navigationController?.pushViewController(nextScreen, animated: true)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        task.taskToDo = notesView.textView.text
        try? context.save()
    }
}

// MARK: - Set Data Method

extension NotesViewController {
    
    func setData() {
        notesView.textView.text = task.taskToDo!
    }
}
