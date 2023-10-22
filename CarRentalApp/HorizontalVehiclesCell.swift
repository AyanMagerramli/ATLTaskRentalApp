//
//  HorizontalVehiclesCell.swift
//  CarRentalApp
//
//  Created by Ayan on 21.10.23.
//

import UIKit

class HorizontalVehiclesCell: UICollectionViewCell {

    @IBOutlet weak var itemsPerCategorLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.carImage.clipsToBounds = false
    }

}
