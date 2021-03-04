//
//  CoffeeView.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 4.03.21.
//

import UIKit

protocol ReturnBackControllerDelegate: class {
    func returnBack()
}
  

class CoffeeView:UIView {
    
    weak var delegate:ReturnBackControllerDelegate?
    let array = ["1","2","3","4","5","6","7","8","9","10"]
    
    fileprivate let pickerNumber:UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.frame = .zero
        return picker
    }()
    
    fileprivate let cupImageInBar:UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "BarCupImage")
        imageView.image = image
        imageView.frame = .zero
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let viewBar:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2274509804, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let mainCoffeeView:UIView = {
        let main = UIView()
        main.backgroundColor = #colorLiteral(red: 0.2, green: 0.2431372549, blue: 0.2862745098, alpha: 1)
        main.translatesAutoresizingMaskIntoConstraints = false
        main.frame = .zero
        return main
    }()
    
    fileprivate let topView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1921568627, blue: 0.2274509804, alpha: 1)
        return view
    }()
    fileprivate let title:UIImageView = {
        let label = UIImageView()
        let image = UIImage(named: "CoffeeTitle")
        label.image = image
        label.frame = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let buttonToBack:UIButton = {
        let imageView = UIButton()
        let image = UIImage(named: "BackButtonCoffeeControl")
        imageView.setImage(image, for: .normal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = .zero
        imageView.addTarget(self.self, action: #selector(tapBackButton), for: .touchUpInside)
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        // mainView and topView
        mainCoffeeView.anchor(top: topAnchor, trailing: trailingAnchor, leading: leadingAnchor, bottom: bottomAnchor)
        topView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 50)
        let sizeTopView = topView.frame.size
        // title constraints
        title.anchor(top: topView.topAnchor, trailing: nil, leading: topView.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: sizeTopView.height / 2 - (title.image?.size.height)! / 2, left: topView.frame.size.width / 2 - (title.image?.size.width)! / 2, bottom: 999, right: 999))
        // buttonToBack constraints
        buttonToBack.anchor(top: topView.topAnchor, trailing: nil, leading: topView.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: sizeTopView.height / 2 - (title.image?.size.height)! / 2, left: 15, bottom: 999, right: 999))
        // viewBar constraints
        viewBar.anchor(top: nil, trailing: nil, leading: leadingAnchor, bottom: bottomAnchor, padding: UIEdgeInsets(top: 999, left: self.frame.width / 2 - viewBar.frame.width / 2, bottom: -200, right: 999), size: CGSize(width: 230, height: 150))
        
        // pickerNumber
        pickerNumber.anchor(top: viewBar.topAnchor, trailing: viewBar.trailingAnchor, leading: viewBar.leadingAnchor, bottom: viewBar.bottomAnchor, padding: UIEdgeInsets(top: 1, left: viewBar.frame.width + 120, bottom: -1, right: -5))
        
        //cupInViewBar
       cupImageInBar.anchor(top: viewBar.topAnchor, trailing: nil, leading: viewBar.leadingAnchor, bottom: nil, padding: UIEdgeInsets(top: viewBar.frame.height / 2 + (cupImageInBar.image?.size.height)! / 2.5, left: 15, bottom: 999, right: 999))
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let mainViews = [mainCoffeeView, topView,viewBar]
        mainViews.forEach { self.addSubview($0) }
        topView.addSubview(title)
        topView.addSubview(buttonToBack)
        viewBar.addSubview(pickerNumber)
        viewBar.addSubview(cupImageInBar)
        self.clipsToBounds = true
        self.layer.cornerRadius = 30
        pickerNumber.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func tapBackButton() {
        delegate?.returnBack()
    }
}


extension CoffeeView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "-"
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        return NSAttributedString(string: array[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
}
