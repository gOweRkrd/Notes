//
//  Extension+TableViewController.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

extension MainViewController {
    
    func setupConstraints() {
    
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.topAnchor,constant:.myTableViewTopAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:.myTableViewTrailingAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:.myTableViewBottomAnchor)
        ])
        
   
    }
}
