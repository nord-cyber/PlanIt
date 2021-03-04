//
//  CellSizes.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 2.03.21.
//

import UIKit

protocol Sizes{
    var totalHeightWithShowDescription:CGFloat? { get set}
    static var paddingHeightViewsCell:UIEdgeInsets { get }
    static var fontSizeDescription:CGFloat { get }
}


struct ConstantSizes:Codable, Sizes {

    static var paddingHeightViewsCell: UIEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    static var fontSizeDescription: CGFloat = 20

    static var heightRow:CGFloat = 70
    
}
