//
//  CategoryCollectionCell.swift
//  CarRentalApp
//
//  Created by Ayan on 26.10.23.
//

import UIKit
//protocol CarItemProtocol {
//    var imageName: String {get}
//    var engineType: String {get}
//    var priceText: String {get}
//    var carName: String {get}
//    var brandName: String {get}
//}

class CategoryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categorySize: UILabel!
    @IBOutlet weak var categoryType: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryView.layer.cornerRadius = 21
    }
    
    func configureCarCell (data: CarItemProtocol) {
        categoryImage.image = UIImage(named: data.imageName)
        categoryType.text = data.brandName
        categorySize.text = data.categorySize
    }
    
    func configureUIWhenChoosed () {
        categoryView.backgroundColor = .systemBlue
        categorySize.textColor = .white
        categoryType.textColor = .white
    }
    
    func configureUIWhenUnChoosed () {
        categoryView.backgroundColor = .white
        categorySize.textColor = .black
        categoryType.textColor = .black
    }
}
