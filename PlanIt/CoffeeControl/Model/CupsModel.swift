//
//  CupsModel.swift
//  PlanIt
//
//  Created by Vadzim Ivanchanka on 7.03.21.
//

import UIKit



struct CupsModel {
    
     var cups = [UIImage]()
        
        
    
    init() {}
    
    
    private  func getNamesCups(number:Int) -> [String]? {
        if number == 0 {
            return nil
        }
        var nameImageCups = [String]()
        for value in 1...number {
            let name = "cup" + "\(value)"
            nameImageCups.append(name)
        }
        return nameImageCups
    }
    
   mutating func getCupsWithImages(number: Int){
    guard let names = getNamesCups(number: number) else { return }
        for nameImage in names {
            guard let image = UIImage(named: nameImage) else { return }
            self.cups.append(image)
        }
    }
}
