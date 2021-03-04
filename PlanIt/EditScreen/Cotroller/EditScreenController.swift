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
    var editCell:CustomCell?
    lazy var editDataField:((CustomCell) -> (Void)) = { [unowned self] data in
        self.loadDataFieldsForEdit(dataCell: data)
        self.editCell = data
    }
    // will take data from CustomCell
    func loadDataFieldsForEdit(dataCell:CustomCell) {
        let title = dataCell.nameTask.text
        let body = dataCell.taskBodyText.text
        
        self.titleTask.text = title
        self.descriptionField.text = body
    }
    
    //MARK: Setup VC
    
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
        setupNavigation()
    }
    
    // navigation bar initial items
    func setupNavigation() {
        let saveIcon = UIImage(named: "SaveNaVBar")?.withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2274509804, alpha: 1)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: saveIcon, style: .plain, target: self, action: #selector(tapSaveButton))
        let backIcon = UIImage(named: "BackNavButton")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: backIcon, style: .plain, target: self, action: #selector(tapBackButton))
    }
    
    // objc functions for navbar
    @objc fileprivate func tapBackButton() {
        dismiss(animated: true, completion: nil)
    }
     @objc fileprivate func tapSaveButton() {
        //   должен ли он отвечать за изменине ячейки?
        if editCell != nil {
            editCell?.nameTask.text = titleTask.text!
            editCell?.taskBodyText.text = descriptionField.text
        } else if titleTask.text != "" && titleTask.text !=  nil{
            delegatePresent?.fillModelFields(titleText: titleTask.text!, descriptionText: descriptionField.text)
        }
        dismiss(animated: true, completion: nil)
        
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
        titleTask.resignFirstResponder()
    }
    
    //MARK: Methods Description Field
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        descriptionField.alpha = 0.9
        textViewPlaceholderChecker()
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        descriptionField.alpha = 0.7
    }
    
    fileprivate func textViewPlaceholderChecker() {
        descriptionField.text = descriptionField.text != ConstantsEdit.placeholderTextView ? descriptionField.text : ""
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // off keyboard when click on free space screen
        titleTask.resignFirstResponder()
        descriptionField.resignFirstResponder()
    }
    
 
}
