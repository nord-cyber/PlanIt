//
//  CoffeeCotronller.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 5.03.21.
//

import UIKit


protocol CountCupsProtocol {
    func cups(_ cups:CupsModel)
}


class CoffeeController:UIViewController {
    
    private let multiplierHeightCoffeeView:CGFloat = 0.72
    var coffeeView = CoffeeView()
    lazy var cupsImages = CupsModel()
    var cups:CupsCollection!
    var cupsSender:CountCupsProtocol?
    override func viewDidLoad() {
        let flow = UICollectionViewFlowLayout()
        cups = CupsCollection(collectionViewLayout: flow)
        
        setup()
        constraintsView()
        
       
        coffeeView.sendNumbersPicker = {[unowned self] number in
            cupsImages.cups = [] 
            if number != cupsImages.cups.count {
                self.cupsImages.getCupsWithImages(number: number)
            }
            cupsSender?.cups(cupsImages)
        }
    }
    
    fileprivate func setup() {
        coffeeView.delegate = self
        coffeeView.delegateSelected = self
        cupsSender = cups
      
        self.view.backgroundColor = .clear
        self.view.addSubview(coffeeView)
        self.view.addSubview(cups)
    }
    
    fileprivate func constraintsView() {
        
        cups.anchor(top: self.coffeeView.topAnchor, trailing: self.coffeeView.trailingAnchor, leading: self.coffeeView.leadingAnchor, bottom: self.coffeeView.bottomAnchor, padding: UIEdgeInsets(top: 100, left: 40, bottom: -250, right: -40))
        coffeeView.frame = view.frame
        coffeeView.anchor(top: nil, trailing: view.trailingAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor)
        coffeeView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierHeightCoffeeView).isActive = true
    }
    
    
    
}

extension CoffeeController: ReturnBackControllerDelegate, CoffeeSelectedDelegate {

    func returnBack() {
        dismiss(animated: true, completion: nil)
    }
   
    func tapedCoffeeSelected() {
    }
    
    
}
