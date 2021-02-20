//
//  CenterYTextViewExtension.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 20.02.21.
//

import UIKit


extension UITextView {

    func centerText() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}
