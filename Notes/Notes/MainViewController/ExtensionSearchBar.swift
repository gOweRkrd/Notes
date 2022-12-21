//
//  ExtensionSearchBar.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

extension MainViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []

        if searchText == "" {
            filteredData = items
        }

            for word in items {

                if word.uppercased().contains(searchText.uppercased()) {
                    filteredData.append(word)

                }

            }

        self.tableView.reloadData()
        }
    }

