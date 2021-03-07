//
//  CustomCellCV.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 7.03.21.
//

import UIKit


class CustomCellCV:UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.anchor(top: topAnchor, trailing: trailingAnchor, leading: leadingAnchor, bottom: bottomAnchor)
    }
}
