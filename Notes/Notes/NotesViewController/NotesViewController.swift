//
//  NotesViewController.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

class NotesViewController: UIViewController {
        
        let textViewText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
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
