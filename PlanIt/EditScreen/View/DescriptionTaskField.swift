//
//  DescriptionTaskField.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 24.02.21.
//

import UIKit



class DescriptionTaskField:UITextView {
    
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
        text = "Description your task (optional)"
        font = UIFont(name: "Courier", size: 14)
        alpha = 0.6
        textContainerInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 0)
        textColor = .white
    }
    
    required init?(coder: NSCoder) {
       fatalError()
    }
}
