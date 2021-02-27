//
//  EditScreenController.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 23.02.21.
//

import UIKit


class EditScreenController:UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    // MARK: Variables
    let titleTask:UITextField = TitleTaskName(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0))
    let descriptionField = DescriptionTaskField()
    weak var taskVC:TasksController?
    var delegatePresent:GetDataFieldsDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        constraintsMainObjects()
        
    }
    
    // setup main objects
    fileprivate func setup() {
        let viewController = self
        let present = PresentData()
        viewController.delegatePresent = present
        present.taskController = taskVC
        
        view.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2274509804, alpha: 1)
        view.addSubview(titleTask)
        view.addSubview(descriptionField)
        titleTask.delegate = self
        descriptionField.delegate = self
    }
    
    // constraint main objects
    fileprivate func constraintsMainObjects() {
        titleTask.anchor(top:view.topAnchor, trailing: nil, leading: view.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top:  (navigationController?.navigationBar.frame.height)! + 20 , left: 15, bottom: 999, right: 999), size: CGSize(width: view.frame.width * 0.7, height: 40))
        descriptionField.anchor(top: titleTask.bottomAnchor, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: UIEdgeInsets(top: 20, left: 15, bottom: -50, right: -15))
    }

    //MARK: Methods Title Task
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   
    func textFieldDidEndEditing(_ textField: UITextField) {
        // temporarily
        delegatePresent?.fillModelFields(titleText: titleTask.text!, descriptionText: descriptionField.text)
        dismiss(animated: true, completion: nil)
    }
    
   
    //MARK: Methods Description Field
    
    func textViewDidBeginEditing(_ textView: UITextView) {
       textViewPlaceholderChecker()
    }
    
    fileprivate func textViewPlaceholderChecker() {
        let alphaPlaceholderDescriptionText = "0.6"
        let alpha = String(format: "%.1f", descriptionField.alpha)
        if alpha == alphaPlaceholderDescriptionText {
            descriptionField.text = nil
            descriptionField.alpha = 1
        }
    }
   
   // temporarily
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // off keyboard when click on free space screen
        titleTask.resignFirstResponder()
        descriptionField.resignFirstResponder()
    }
    
}
