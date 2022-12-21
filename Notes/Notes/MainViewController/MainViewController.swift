//
//  ViewController.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//


import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    static let myTableViewTopAnchor : CGFloat =  100
    static let myTableViewTrailingAnchor : CGFloat = 0
    static let myTableViewBottomAnchor : CGFloat = 0
   
}

class MainViewController: UIViewController,UITableViewDelegate {
    
    let myTableView = UITableView(frame: .zero, style: .plain)
    
    var items = ["Fist Cell","Second Cell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        view.backgroundColor = .orange

        myTableView.register(MyOwnCell.self, forCellReuseIdentifier: "CellID")
        myTableView.dataSource = self
        myTableView.delegate = self
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
    
    
}
