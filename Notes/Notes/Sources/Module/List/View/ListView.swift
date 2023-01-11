//
//  ListView.swift
//  Notes
//
//  Created by Александр Косяков on 25.12.2022.
//

import UIKit

final class ListView: UIView {
    
    // MARK: - Properties
    
    let myTableView = UITableView(frame: .zero, style: .plain)
    lazy var searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 242 / 255, green: 242 / 255, blue: 247 / 255, alpha: 1)
        myTableView.register(MyOwnCell.self, forCellReuseIdentifier: "CellID")
        myTableView.rowHeight = 65
        myTableView.backgroundColor = UIColor(red: 242 / 255, green: 242 / 255, blue: 247 / 255, alpha: 1)
        myTableView.separatorColor = .clear
    
        addSybView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

private extension ListView {
    
    func addSybView() {
        addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: .myTableViewTopAnchor),
            myTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
