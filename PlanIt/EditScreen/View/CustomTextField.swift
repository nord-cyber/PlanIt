//
//  CustomTextField.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 24.02.21.
//

import UIKit



class TitleTaskName:UITextField {
    
    var edgeTextPadding:UIEdgeInsets
    
    init(insets: UIEdgeInsets) {
        edgeTextPadding = insets
        super.init(frame: .zero)
        layer.cornerRadius = 20
  
        attributedPlaceholder = NSAttributedString(string: "Title your task", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .justified
        textColor = .white
        font = UIFont(name: "Courier", size: 18)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeTextPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeTextPadding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("fatal error coder")
    }
}
