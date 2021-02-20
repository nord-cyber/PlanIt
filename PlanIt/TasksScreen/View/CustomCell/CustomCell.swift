//
//  TabelViewCell.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//

import UIKit


class CustomCell:UITableViewCell {
    
    var pointerToDoTask:UIImageView = {
        let pointer = UIImageView(image: UIImage(named: "notCompleted"))
        pointer.frame = .zero
        pointer.translatesAutoresizingMaskIntoConstraints = false
        return pointer
    }()
    
    // initialization textView
    var taskBodyText:UITextView = {
        var body = UITextView()
        body.font = UIFont(name: "Courier", size: 20)
        body.adjustsFontForContentSizeCategory = false
        body.frame = .zero
        body.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        body.translatesAutoresizingMaskIntoConstraints = false
        
        return body
    }()
    
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        
            // MARK: Constraints and setup
       
        // pointer
        self.addSubview(pointerToDoTask)
        guard let sizePointImage = pointerToDoTask.image?.size else { return }
        pointerToDoTask.anchor(top: self.centerYAnchor, trailing: nil, leading: self.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: -(sizePointImage.height / 2), left: 5, bottom: 999, right: 999))
        
        // body text
        addSubview(taskBodyText)
        taskBodyText.anchor(top: self.topAnchor, trailing: self.trailingAnchor, leading: pointerToDoTask.trailingAnchor, bottom: self.bottomAnchor, padding: UIEdgeInsets(top: 5, left: 10, bottom: -5, right: 8))
        
        // put text in center Y
        taskBodyText.centerText()
       
    }
    // for custom select cell 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
    
    
}



