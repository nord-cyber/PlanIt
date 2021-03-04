//
//  PresentDataMode.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 27.02.21.
//

import Foundation



class PresentData: GetDataFieldsDelegate {
    
    // variables
    var data:DataFields!
    var taskController:PresentDataFieldsDelegate?
    
    
    // Method GetFieldsDataDelegate from EditScreen to TasksVC
    func fillModelFields(titleText: String, descriptionText: String?) {
        self.data = DataFields(titleTask: titleText, descriptionTask: descriptionText,sizes: CellSizes(totalHeight: 70, descriptionHeight: 0), isOpen: false)
        self.taskController?.presentDataFields(data)
    }
}
