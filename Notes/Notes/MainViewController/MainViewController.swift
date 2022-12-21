//
//  ViewController.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//


import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    static let myTableViewTopAnchor : CGFloat =  50
}

class MainViewController: UIViewController,UITableViewDelegate, UISearchBarDelegate {
    
    let myTableView = UITableView(frame: .zero, style: .plain)
    lazy var searchController = UISearchController(searchResultsController: nil)
    
    var items = ["Fist Cell","Second Cell","Second Cell","Second Cell","Second Cell","Second Cell"]
    
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
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.backButtonTitle = "back"
        
        searchController.searchBar.delegate = self
        
        var image = UIImage(systemName: "plus.circle")
        image?.withTintColor(.black)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(addNotes))

    }
    
    func setupSearchBar() {
        self.navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    @objc func addNotes(){
        let nextScreen = NotesViewController()
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
}

// MARK: - TableViewDataSource,TableViewDelegate

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? MyOwnCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
        }
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    // удаление ячеек
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.fade)
            
            tableView.endUpdates()
        }
    }
    
}
