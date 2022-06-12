//
//  PeopleListCollectionView.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 09/06/22.
//

import Foundation
import UIKit

class PeopleListCollectionView: UICollectionView {
    
    //MARK:-
    //MARK:- ------- PROPERTIES
    var viewModel: PeopleListViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func config(viewModel: PeopleListViewModel) {
        self.viewModel = viewModel
    }
}

// MARK:-
// MARK:- ------- General Functions
extension PeopleListCollectionView {
    fileprivate func setUpView() {
        self.delegate = self
        self.dataSource = self
        
        //...Register Cell
        self.register(UINib(nibName: CellIndentifier.PeopleListCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CellIndentifier.PeopleListCollectionViewCell)
    }
}

//MARK:-
//MARK:- ------- CollectionView Delegate & Datasources
extension PeopleListCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.peopleCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIndentifier.PeopleListCollectionViewCell, for: indexPath) as? PeopleListCollectionViewCell {
            
            if let peopleDetail = viewModel.peopleAt(index: indexPath.row) {
                cell.configureCell(peopleDetails: peopleDetail)
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

//MARK:-
//MARK:- ------- Collection View FlowLayout
extension PeopleListCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = self.calculateCellSize(numberOfItemInRow: 2)
        return cellSize
    }
}

