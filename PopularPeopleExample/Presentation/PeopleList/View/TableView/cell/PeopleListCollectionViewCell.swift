//
//  PeopleListCollectionViewCell.swift
//  PopularPeopleExample
//
//  Created by Patel Dhruvkumar Kiranbhai on 09/06/22.
//

import Foundation
import Kingfisher
import UIKit

class PeopleListCollectionViewCell: UICollectionViewCell {
    
    // MARK: -
    // MARK: - @IBOutlet.
    @IBOutlet weak var imgVProfile:UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!

    // MARK: -
    // MARK: - Override Methods.
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 12
    }
    
    func configureCell(peopleDetails: PeopleResults) {
        
        lblName.text = peopleDetails.name
        lblGender.text = peopleDetails.gender == 0 ? "Male" : "Female"
        
        let imageURL = URL(string: APIList.imageBaseURL + (peopleDetails.profile_path ?? ""))!
        let resource = ImageResource(downloadURL: imageURL, cacheKey: imageURL.lastPathComponent)
        
        imgVProfile.layer.cornerRadius = 12
        imgVProfile.kf.indicatorType = .activity
        imgVProfile.kf.setImage(
            with: resource,
            placeholder: UIImage(named: ImageAssets.imgPlaceHolder))
    }
}
