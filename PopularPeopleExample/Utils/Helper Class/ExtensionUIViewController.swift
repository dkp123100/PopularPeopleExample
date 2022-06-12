//
//  ExtensionUIViewController.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 13/06/22.
//

import Foundation
import UIKit

typealias alertActionHandler = ((UIAlertAction) -> ())?

extension UIViewController {
    
    func presentAlertViewWithOneButton(alertTitle:String? , alertMessage:String? , btnOneTitle:String , btnOneTapped:alertActionHandler) {
        
        let alertController = UIAlertController(title: alertTitle ?? "", message: alertMessage ?? "", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: btnOneTitle, style: .default, handler: btnOneTapped))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}
