//
//  MyOwnCell.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

class MyOwnCell: UITableViewCell {
    
    // MARK: - Castomize Cell
    
    func castomizeCell () {
        
//        contentView.backgroundColor = UIColor(red: 237/255, green: 231/255, blue: 229/255, alpha: 1)
//        contentView.layer.borderColor = UIColor.white.cgColor
        
    }
    
//    func setupContent(model: CellModel) {
//     
//    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        configureView()
        castomizeCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
