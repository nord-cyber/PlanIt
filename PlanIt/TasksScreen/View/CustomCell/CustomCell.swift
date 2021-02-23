//
//  TabelViewCell.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//

import UIKit




class CustomCell:UITableViewCell, UITextViewDelegate {
    
    weak var delegate:EditingTaskDelegate?
    
    var mainView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        view.frame = .zero
        return view
    }()
  
    var pointerToDoTask:UIImageView = {
        let pointer = UIImageView(image: UIImage(named: "notCompleted"))
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
    
    // initialization textView
   lazy var taskBodyText:UILabel = {
        var body = UILabel()
        body.font = UIFont(name: "Courier", size: 17)
        body.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        body.textColor = .white
        body.frame = .zero
        body.isHidden = true
        body.translatesAutoresizingMaskIntoConstraints = false
        return body
    }()
    
    var nameTask:UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "Courier", size: 20)
        name.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        name.textColor = .white
        name.frame = .zero
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        self.backgroundColor = .clear
        editButton.addTarget(self, action: #selector(tapEditingButton), for: .touchUpInside)
        constraintsElementsView()
     
    }
    
    // MARK: Constraints and setup
    fileprivate func constraintsElementsView() {
        
        // mainView constraints
        self.addSubview(mainView)
        mainView.anchor(top: topAnchor, trailing: trailingAnchor, leading: leadingAnchor, bottom: bottomAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: -10, right: -5))
        
        
        // pointer about completion tasks
        mainView.addSubview(pointerToDoTask)
        guard let sizePointImage = pointerToDoTask.image?.size else { return }
        pointerToDoTask.anchor(top: mainView.centerYAnchor, trailing: nil, leading: mainView.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: -(sizePointImage.height / 2), left: 5, bottom: 999, right: 999))
        
        // name text
        mainView.addSubview(nameTask)
        nameTask.anchor(top: self.topAnchor, trailing: self.trailingAnchor, leading: pointerToDoTask.trailingAnchor, bottom: self.bottomAnchor, padding: UIEdgeInsets(top: 20, left: 10, bottom: -20, right: -10))
            
         
        
        // editButton setup
        mainView.addSubview(editButton)
        editButton.anchor(top: mainView.centerYAnchor, trailing: mainView.trailingAnchor, leading: nil, bottom: nil, padding: UIEdgeInsets(
                            top: -((editButton.imageView?.image?.size.height)! / 2),
                            left: 999,
                            bottom: 999,
                            right: -15))
    }
    
    
    // for custom select cell 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        
    }
    
    @objc func topDone(sender:Any) {
        taskBodyText.endEditing(true)
    }
    
    @objc func tapEditingButton() {
        delegate?.presentEditingScreen(to: self)
    }
}



