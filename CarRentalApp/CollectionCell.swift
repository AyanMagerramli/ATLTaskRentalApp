//
//  CollectionCell.swift
//  CarRentalApp
//
//  Created by Ayan on 26.10.23.
//

import UIKit

protocol CarItemProtocol {
    var imageName: String {get}
    var engineType: String {get}
    var priceText: String {get}
    var carName: String {get}
    var brandName: String {get}
}

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
    
    func configureCarCell (data: CarItemProtocol) {
        imageName.image = UIImage(named: data.imageName)
        carBrand.text = data.brandName
        carModel.text = data.carName
        carPrice.text = data.priceText
        engineType.text = data.engineType
    }
}
