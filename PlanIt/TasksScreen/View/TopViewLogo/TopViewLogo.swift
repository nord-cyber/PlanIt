//
//  TopViewLogo.swift
//  JustDoIt
//
//  Created by Vadzim Ivanchanka on 16.02.21.
//

import UIKit

// MARK: Fix image constraints

class TopViewLogo:UIView {
    
  //MARK: Initialization objects
    
    // image logo
    var imageMainTopLogoView:UIImageView = {
        let mainViewImage = UIImageView()
        mainViewImage.image = UIImage(named: "Top Image Logo")
        mainViewImage.contentMode = .scaleToFill
        mainViewImage.translatesAutoresizingMaskIntoConstraints = false
        return mainViewImage
    }()
    
    // blur with text logo
    var blurViewTopLogo:UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "Exclude")
       // view.clipsToBounds = true
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // label in blur view
    var labelTopLogoView:UILabel = {
        let label = UILabel()
        label.text = "Have a nice day!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
       // self.backgroundColor = .red
        installationViewsToTopViewLogo()
    }
    
    
    
    
    private func installationViewsToTopViewLogo() {
        
        // add to main view
        let viewsLogo:[UIView] = [imageMainTopLogoView,blurViewTopLogo, labelTopLogoView]
        viewsLogo.forEach {
            self.addSubview($0)
        }
        
        // anchor objects views
        imageMainTopLogoView.anchor(top: self.topAnchor, trailing: self.trailingAnchor, leading: self.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),size: CGSize(width: self.frame.width, height: self.frame.height))
        blurViewTopLogo.anchor(top: self.topAnchor, trailing: self.trailingAnchor, leading: self.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 999, right: 0),size: CGSize(width: self.frame.width, height: self.frame.height))
        labelTopLogoView.anchor(top: nil, trailing: trailingAnchor, leading: nil, bottom: bottomAnchor, padding: UIEdgeInsets(top: 999, left: 999, bottom: -10, right: -10))
        
    }
    
}


