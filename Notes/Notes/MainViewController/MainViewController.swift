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
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
        let ac = UIAlertController(title: "Add Task", message: "add new task", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            let textField = ac.textFields?[0]
            self.saveTask(taskToDo:(textField?.text)!)
            DispatchQueue.main.async {
//                self.tableView.reloadData()
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
    
   //  удаление ячеек
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            notesItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.fade)

            tableView.endUpdates()
        }
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        guard let mealToDelete = task.taskToDo?[indexPath.row] as? Task,editingStyle == .delete else {return}
//
//        context.delete(mealToDelete)
//        // пересохраняем наш контекст
//        do {
//            try context.save()
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        } catch let error as NSError {
//            print("Error: \(error),description \(error.userInfo)")
//        }
//
//    }


    
   
}





