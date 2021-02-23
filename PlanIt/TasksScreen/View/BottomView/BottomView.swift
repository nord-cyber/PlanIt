//
//  BottomView.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 23.02.21.
//

import UIKit


class BottomView:UIView {
    
    
    var addNewTaskButton:UIButton = {
        let button = UIButton()
        
        
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
