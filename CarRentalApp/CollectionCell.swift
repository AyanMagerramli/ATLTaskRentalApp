//
//  CollectionCell.swift
//  CarRentalApp
//
//  Created by Ayan on 26.10.23.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var engineType: UILabel!
    @IBOutlet weak var drivingDuration: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var engine: UILabel!
    @IBOutlet weak var carModel: UILabel!
    @IBOutlet weak var carBrand: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
}
