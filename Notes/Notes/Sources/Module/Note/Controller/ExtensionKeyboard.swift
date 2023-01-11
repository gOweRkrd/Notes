//
//  ExtensionKeyboard.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

extension UITextView {
    
    func addButtonKeyboard(bold: (target: Any, action: Selector)? = nil,
                           italic: (target: Any, action: Selector)? = nil,
                           underline: (target: Any, action: Selector)? = nil) {
        
        let bold = bold ?? (target: self, action: #selector(boldlButtonTapped))
        let italic = italic ?? (target: self, action: #selector(italicButtonTapped))
        let underline = underline ?? (target: self, action: #selector(underlineButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Bold", style: .plain, target: bold.target, action: bold.action),
            UIBarButtonItem(title: "Italic", style: .done, target: italic.target, action: italic.action),
            UIBarButtonItem(title: "Underline", style: .done, target: underline.target, action: underline.action)
        ]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    // MARK: - Private Method
    
    private  func attributedString(highlightedTextStyle: [NSAttributedString.Key: Any]) {
        let selfText = self.attributedText
        
        let formattedString = NSMutableAttributedString(attributedString: selfText!)
        
        let range = self.selectedRange
        
        formattedString.setAttributes(highlightedTextStyle, range: range)
        self.attributedText = formattedString
    }
    
    // MARK: - Action Method
    
    @objc func boldlButtonTapped() {
        self.resignFirstResponder()
        
        self.attributedString(highlightedTextStyle: [.font: UIFont.boldSystemFont(ofSize: 20)])
        
    }
    
    @objc func italicButtonTapped() {
        self.resignFirstResponder()
        
        self.attributedString(highlightedTextStyle: [.font: UIFont.italicSystemFont(ofSize: 20)])
        
    }
    
    @objc func underlineButtonTapped() {
        self.resignFirstResponder()
        
        self.attributedString(highlightedTextStyle: [.underlineStyle: NSUnderlineStyle.thick.rawValue, .font: UIFont.systemFont(ofSize: 20)])
        
    }
}
