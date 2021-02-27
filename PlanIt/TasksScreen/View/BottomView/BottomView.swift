//
//  BottomView.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 23.02.21.
//

import UIKit



class BottomView:UIView {
    
    weak var delegate:EditingTaskDelegate?
    
    var addNewTaskButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "AddButton"), for: .normal)
        button.frame = .zero
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self.self, action: #selector(tapAddNewTask), for: .touchUpInside)
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2274509804, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(addNewTaskButton)
        addNewTaskButton.anchor(top: topAnchor, trailing: trailingAnchor, leading: nil, bottom: bottomAnchor, padding: UIEdgeInsets(top: 5, left: 999, bottom: -5, right: -15))
        
    }
    
    @objc func tapAddNewTask() {
        delegate?.presentEditingScreen(to: nil)
    }
}
