//
//  UILabel + lines.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 3.03.21.
//

import UIKit


extension UILabel {
    var maxNumberOfLines: CGFloat {
        let maxSize = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(MAXFLOAT))
        let text = (self.text ?? "") as String
        let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font!], context: nil).height
        let lineHeight = font.lineHeight
        return CGFloat(ceil(textHeight / lineHeight))
    }
}
