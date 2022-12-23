import UIKit
import CoreData

// MARK: - Constant Constraints

extension CGFloat {
    static let myTableViewTopAnchor : CGFloat =  50
}

class MainViewController: UIViewController {
    
    let myTableView = UITableView(frame: .zero, style: .plain)
    lazy var searchController = UISearchController(searchResultsController: nil)
    
    var notesItems:[Task] = []
    var context: NSManagedObjectContext!
    var task: Task!
    
    //    var filteredData: [Any] = []
    
    
    // метод сохраняет данные в СoreData
    func saveTask (taskToDo:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Task
        taskObject.taskToDo = taskToDo
        do {
            try context.save()
            notesItems.append(taskObject)
            print("Saved!Good Job!")
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            notesItems = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupSearchBar()
        view.backgroundColor = .white
        
        myTableView.register(MyOwnCell.self, forCellReuseIdentifier: "CellID")
        myTableView.dataSource = self
        myTableView.delegate = self
        
        navigationItem.title = "Notes"
        navigationItem.backButtonTitle = "back"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //                filteredData = notesItems
        
        lazy var searchController = UISearchController(searchResultsController: nil)
        
        // добавляем кнопку в NavigationBar
        let image = UIImage(systemName: "plus.circle")
        image?.withTintColor(.black)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(addNotes))
        
        
    }
    
    func setupSearchBar() {
        self.navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc func addNotes() {
        let ac = UIAlertController(title: "Add Notes", message: "add new notes", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            let textField = ac.textFields?[0]
            self.saveTask(taskToDo:(textField?.text)!)
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default,handler: nil)
        ac.addTextField {
            textField in
            
        }
        
        ac.addAction(ok)
        ac.addAction(cancel)
        present(ac,animated: true,completion: nil)
        
    }
    
    func delete(_ contact: NSManagedObject, at indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        managedObjectContext.delete(contact)
        notesItems.remove(at: indexPath.row)
        
        
    }
    
}

// MARK: - TableViewDataSource,TableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notesItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? MyOwnCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
        }
        let task = notesItems[indexPath.row]
        cell.textLabel?.text = task.taskToDo
        
        return cell
    }
    
    //      удаление ячеек
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            do {
                
                let notes = notesItems[indexPath.row]
                delete(notes, at: indexPath)
                saveTask(taskToDo: "")
                self.myTableView.reloadData()
                
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextScreen = NotesViewController()
        self.navigationController?.pushViewController(nextScreen, animated: true)
        
    }
    
    
}

//extension MainViewController: NotesViewControllerDelegate {
//    func didTapSave() {
//
//    }
//
//}







