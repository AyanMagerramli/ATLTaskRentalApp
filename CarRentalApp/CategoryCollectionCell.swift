//
//  CategoryCollectionCell.swift
//  CarRentalApp
//
//  Created by Ayan on 26.10.23.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categorySize: UILabel!
    @IBOutlet weak var categoryType: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //self.categoryImage.clipsToBounds = false
        categoryView.layer.cornerRadius = 15
    }
}
