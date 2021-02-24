//
//  EditScreenController.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 23.02.21.
//

import UIKit


class EditScreenController:UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2274509804, alpha: 1)
        view.addSubview(titleTask)
        view.addSubview(descriptionField)
        titleTask.delegate = self
        descriptionField.delegate = self
        titleTask.anchor(top:view.topAnchor, trailing: nil, leading: view.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top:  (navigationController?.navigationBar.frame.height)! + 20 , left: 15, bottom: 999, right: 999), size: CGSize(width: view.frame.width * 0.7, height: 40))
        descriptionField.anchor(top: titleTask.bottomAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: UIEdgeInsets(top: 20, left: 15, bottom: -50, right: -15))
    }
    
    let titleTask:UITextField = TitleTaskName(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0))
    let descriptionField = DescriptionTaskField()
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTask.resignFirstResponder()
        descriptionField.resignFirstResponder()
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let alpha = String(format: "%.1f", descriptionField.alpha)
      
        if alpha == "0.6" {
            descriptionField.text = nil
            descriptionField.alpha = 1
        }
            
    }
    func textViewDidEndEditing(_ textView: UITextView) {
    }
    
}
