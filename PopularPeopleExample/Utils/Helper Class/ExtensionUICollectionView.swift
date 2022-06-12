//
//  HelperFuntion.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 11/06/22.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func calculateCellSize(numberOfItemInRow: Int) -> CGSize {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfItemInRow - 1))
        
        let size = (self.bounds.width - totalSpace) / CGFloat(numberOfItemInRow)
        return CGSize(width: size, height: size * 2.2)
    }
}
