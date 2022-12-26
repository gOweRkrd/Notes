//
//  ExtensionKeyboard.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit


extension UITextView {
    
    func addButtonKeyboard(Bold: (target: Any, action: Selector)? = nil,
                           Italic: (target: Any, action: Selector)? = nil,
                           Underline: (target: Any, action: Selector)? = nil,
                           Font:(target: Any, action: Selector)? = nil,
                           Image:(target: Any, action: Selector)? = nil) {
        
        let Bold = Bold ?? (target: self, action: #selector(boldlButtonTapped))
        let Italic = Italic ?? (target: self, action: #selector(italicButtonTapped))
        let Underline = Underline ?? (target: self, action: #selector(underlineButtonTapped))
        let Font = Font ?? (target: self, action: #selector(fontButtonTapped))
        let Image = Image ?? (target: self, action: #selector(imageButtonTapped))
        
        let toolbar : UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Bold", style: .plain, target: Bold.target, action: Bold.action),
            UIBarButtonItem(title: "Italic", style: .done, target: Italic.target, action: Italic.action),
            UIBarButtonItem(title: "Underline", style: .done, target: Underline.target, action: Underline.action),
            UIBarButtonItem(title: "Font", style: .done, target: Font.target, action: Font.action),
            UIBarButtonItem(title: "Image", style: .done, target: Image.target, action: Image.action)
        ]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    // MARK: - Private Method
    
   private  func attributedString(highlightedTextStyle: [NSAttributedString.Key: Any]) -> Void {
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
    @objc func fontButtonTapped() {
        self.resignFirstResponder()
        
    }
    
    @objc func imageButtonTapped() {
        self.resignFirstResponder()
        
    }
    
}





