//
//  FieldsProtocols.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 27.02.21.
//

import Foundation


protocol PresentDataFieldsDelegate: class{
    func presentDataFields(_ data:DataFields)
}

protocol GetDataFieldsDelegate: class {
    func fillModelFields(titleText:String, descriptionText:String?)
}
