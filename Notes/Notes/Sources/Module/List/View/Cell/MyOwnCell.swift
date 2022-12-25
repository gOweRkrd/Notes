//
//  MyOwnCell.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

class MyOwnCell: UITableViewCell {

    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
