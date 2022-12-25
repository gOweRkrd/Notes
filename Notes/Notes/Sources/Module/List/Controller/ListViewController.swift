import UIKit
import CoreData

// MARK: - Constant Constraints

extension CGFloat {
    static let myTableViewTopAnchor : CGFloat =  50
}

final class ListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let listView = ListView()
    private var model = ListModel()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = listView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupNavigationItem()
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            model.notesItems = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Private Method
    
    private func setupDelegate() {
        listView.myTableView.dataSource = self
        listView.myTableView.delegate = self
        listView.searchController.searchBar.delegate = self
    }
    
    private func setupNavigationItem() {
        
        let image = UIImage(systemName: "plus.circle")
        image?.withTintColor(.black)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(addNotes))
        navigationItem.title = "Notes"
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
       
    }
    
    private func setupSearchBar() {
        self.navigationItem.searchController = listView.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: - Action Method
    
    @objc
    private func addNotes() {
        let ac = UIAlertController(title: "Add Notes", message: "add new notes", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            let textField = ac.textFields?[0]
            self.model.saveTask(taskToDo:(textField?.text)!)
            DispatchQueue.main.async {
                self.listView.myTableView.reloadData()
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

// MARK: - SearchBar Delegate

extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        model.searchText = searchText.lowercased()
        listView.myTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        model.searchText = ""
        listView.myTableView.reloadData()
    }
}

// MARK: - TableViewDataSource

extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? MyOwnCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
        }
        
        cell.textLabel?.text = model.filteredData[indexPath.row].taskToDo
        
        return cell
    }
}

// MARK: - TableViewDelegate

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            do {
                let notes = model.filteredData[indexPath.row]
                model.delete(notes, at: indexPath)
                listView.myTableView.reloadData()
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextScreen = NotesViewController()
        nextScreen.task = model.filteredData[indexPath.item]
        tableView.deselectRow(at: indexPath, animated: false)
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
}




