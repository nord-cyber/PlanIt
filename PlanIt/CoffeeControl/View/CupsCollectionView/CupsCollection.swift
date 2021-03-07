//
//  CupsColletion.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 6.03.21.
//

import UIKit

class CupsCollection:UICollectionView{
    
   
    
 
    private lazy var cellModel = CupsModel()
    override init(frame: CGRect = .zero, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(CustomCellCV.self, forCellWithReuseIdentifier: "cell")
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CupsCollection:UICollectionViewDataSource, UICollectionViewDelegate, CountCupsProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModel.cups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCellCV
        cell.imageView.image = cellModel.cups[indexPath.row]
        return cell
    }
    
    func cups(_ cups: CupsModel) {
        cellModel = cups
        reloadData()
    }
    
   
    
}

extension CupsCollection: UICollectionViewDelegateFlowLayout {
    // outputs cells in center CV
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let numberOfItems = CGFloat(collectionView.numberOfItems(inSection: section))
        let combinedItemWidth = (numberOfItems * flowLayout.itemSize.width) + ((numberOfItems - 1)  * flowLayout.minimumInteritemSpacing)
        let padding = (collectionView.frame.width - combinedItemWidth) / 2
        if padding < 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
}
 
