//
//  PeopleListVC.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 09/06/22.
//

import UIKit
import ProgressHUD
import PromiseKit

class PeopleListVC: UIViewController {
    
    @IBOutlet private weak var peopleListCollectionView: PeopleListCollectionView!
    
    private var viewModel: PeopleListViewModel = makePeopleListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchPeopleList()
    }
    
    private func setupView() {
        peopleListCollectionView.config(viewModel: viewModel)
    }
    
    private func fetchPeopleList() {
        
        ProgressHUD.show()
        
        let fetchPeopleListPromise: Promise<[PeopleResults]> = viewModel.fetchPeopleList()
        
        firstly {
            fetchPeopleListPromise
        }.done { [weak self] peopleList in
            self?.peopleListCollectionView?.reloadData()
        }
        .ensure {
            ProgressHUD.dismiss()
        }
        .catch { error in
            self.presentAlertViewWithOneButton(alertTitle: nil, alertMessage: MessageConstants.someThingWentWrong, btnOneTitle: MessageConstants.ok, btnOneTapped: nil)
        }
    }
    
}

