//
//  DataFeildsModel.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 24.02.21.
//

import UIKit



struct DataFields:Codable {
    let titleTask:String
    let descriptionTask:String?
    var sizes:CellSizes
    var isOpen:Bool
}

struct CellSizes:Codable {
    var totalHeight:CGFloat
    var descriptionHeight:CGFloat
}
