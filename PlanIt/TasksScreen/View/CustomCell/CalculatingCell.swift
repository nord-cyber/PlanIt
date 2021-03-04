//
//  DescriptionLogic.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 2.03.21.
//

import UIKit




class DescriptionShowLogic:ShowDescription {
    
  // calculating cell when user tapped for show full task with description
    func showDescription(for cell:CustomCell?) -> CellSizes? {
        if cell?.taskBodyText.text != "" {
            guard  let descriptionLineHeight = cell?.taskBodyText.font.lineHeight,
                   let numberOfLines = cell?.taskBodyText.maxNumberOfLines else { return nil}
            let heightDescription = CGFloat(descriptionLineHeight * numberOfLines)
            let heightRow = ConstantSizes.heightRow + heightDescription + ConstantSizes.paddingHeightViewsCell.top + ConstantSizes.paddingHeightViewsCell.bottom
            return CellSizes(totalHeight: heightRow, descriptionHeight: heightDescription)
        }
        return nil
    }
}

