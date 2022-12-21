//
//  NotesViewController.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

class NotesViewController: UIViewController {
        
        let textViewText = ""
        
        lazy var textView: UITextView = {
            let textView = UITextView()
            textView.text = textViewText
            textView.isScrollEnabled = false
            textView.backgroundColor = .white
         
            textView.addButtonKeyboard()
            return textView
        }()
    

        override func viewDidLoad() {
            super.viewDidLoad()
            setupConstraints()
            view.backgroundColor = .white
           

        }
    }

extension NotesViewController {
    
        func setupConstraints() {
         
            view.addSubview(textView)
            
            textView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                textView.topAnchor.constraint(equalTo: view.topAnchor,constant: 80),
                textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                textView.heightAnchor.constraint(equalTo: view.heightAnchor),

            ])
        }
    }
