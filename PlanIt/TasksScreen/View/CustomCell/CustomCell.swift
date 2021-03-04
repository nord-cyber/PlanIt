//
//  TabelViewCell.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//

import UIKit




class CustomCell:UITableViewCell, UITextViewDelegate {
    
    weak var delegate:EditingTaskDelegate?
    fileprivate var isDone:Bool = false
    var mainView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        view.frame = .zero
        return view
    }()
  
    var descriptionMain:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        view.frame = .zero
        return view
    }()
    
    var pointerToDoTask:UIButton = {
        let pointer = UIButton()
        let image = UIImage(named: "notCompleted")
        pointer.setImage(image, for: .normal)
        pointer.frame = .zero
        pointer.translatesAutoresizingMaskIntoConstraints = false
        return pointer
    }()
    
    var editButton:UIButton = {
        var button = UIButton()
        let image = UIImage(named: "Edit")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // initialization textView #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        var taskBodyText:UILabel = {
        var body = UILabel()
        body.font = UIFont(name: "Courier", size: ConstantSizes.fontSizeDescription)
        //body.backgroundColor = .red
        body.textColor = .lightGray
        body.layer.cornerRadius = 20
        body.numberOfLines = 0
        body.frame = .zero
        body.translatesAutoresizingMaskIntoConstraints = false
        return body
    }()
    
    var nameTask:UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "Courier", size: 18)
        name.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        name.textColor = .white
        name.frame = .zero
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        self.backgroundColor = .clear
        pointerToDoTask.addTarget(self, action: #selector(tapChangePointer), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(tapEditingButton), for: .touchUpInside)
        constraintsElementsView()
     
    }
    
    // MARK: Constraints and setup
    fileprivate func constraintsElementsView() {
        
        // mainView constraints
        self.addSubview(mainView)
        mainView.anchor(top: topAnchor, trailing: trailingAnchor, leading: leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: 5, left: 5, bottom: -10, right: -5), size: CGSize(width: 0, height: 60))
        
        self.addSubview(descriptionMain)
        descriptionMain.anchor(top: mainView.bottomAnchor, trailing: trailingAnchor, leading: leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: 10, left: 5, bottom: -5, right: -5),size: CGSize(width: 0, height: 0))
        
        
        // pointer about completion tasks
        mainView.addSubview(pointerToDoTask)
        guard let sizePointImage = pointerToDoTask.imageView?.image?.size else { return }
        pointerToDoTask.anchor(top: mainView.centerYAnchor, trailing: nil, leading: mainView.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: -(sizePointImage.height / 2), left: 5, bottom: 999, right: 999))
        
        // name text
        mainView.addSubview(nameTask)
        nameTask.anchor(top: mainView.topAnchor, trailing: mainView.trailingAnchor, leading: pointerToDoTask.trailingAnchor, bottom: mainView.bottomAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10))
            
         
        
        // editButton setup
        mainView.addSubview(editButton)
        editButton.anchor(top: mainView.centerYAnchor, trailing: mainView.trailingAnchor, leading: nil, bottom: nil, padding: UIEdgeInsets(
                            top: -((editButton.imageView?.image?.size.height)! / 2),
                            left: 999,
                            bottom: 999,
                            right: -15))
        
        
        if descriptionMain.frame.size.height != 0 {
            descriptionMain.addSubview(taskBodyText)
            taskBodyText.anchor(top: descriptionMain.topAnchor, trailing: descriptionMain.trailingAnchor, leading: descriptionMain.leadingAnchor, bottom: descriptionMain.bottomAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
        }
       
    }
    
    
    // for custom select cell 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }

    // trigger for edit button cell
    @objc func tapEditingButton() {
        delegate?.presentEditingScreen(to: self)
    }
    // trigger for pointer
    @objc func tapChangePointer() {
        self.isDone = !isDone
        let image:UIImage? = isDone != true ? UIImage(named: "notCompleted") :  UIImage(named: "Completed")
        self.pointerToDoTask.setImage(image, for: .normal)
    }
}



