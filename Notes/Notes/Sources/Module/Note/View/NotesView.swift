//
//  NotesView.swift
//  Notes
//
//  Created by Александр Косяков on 25.12.2022.
//

import UIKit

class NotesView: UIView {
    
    // MARK: - Cosomize
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = true
        textView.backgroundColor = .white
        textView.font = .systemFont(ofSize: 20)
        return textView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

private extension NotesView {
    
    func addSubView() {
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: self.topAnchor),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
