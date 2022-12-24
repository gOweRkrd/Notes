//
//  NotesViewController.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

//protocol NotesViewDelegate: AnyObject {
//    func didTapSave()
//}

class NotesViewController: UIViewController {
    
//    weak var delegate: NotesViewDelegate?
    
    var task: Task!
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.backgroundColor = .white
        textView.font = .systemFont(ofSize: 20)
        textView.addButtonKeyboard()
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setData()
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
    
    func setData() {
//        delegate?.didTapSave()
        textView.text = task.taskToDo!
    }
}
