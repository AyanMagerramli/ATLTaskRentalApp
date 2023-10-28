//
//  SearchBarCollectionCell.swift
//  CarRentalApp
//
//  Created by Ayan on 27.10.23.
//

import UIKit

class SearchBarCollectionCell: UICollectionViewCell {

    @IBOutlet weak var searchBarField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    @IBAction func searchAction(_ sender: Any) {
        print("\(searchBarField.text ?? "")")
    }
}
