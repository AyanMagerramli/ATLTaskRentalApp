//
//  HorizontalViewModel.swift
//  CarRentalApp
//
//  Created by Ayan on 03.11.23.
//

import Foundation

class HorizontalViewModel {
    
    private let coreData: CoredataForCategory
    var categories: [CategoryList] = []
    var callback: (()-> Void)?
    
    init(coreData: CoredataForCategory) {
        self.coreData = coreData
    }
    
    func fetchItems () {
        coreData.fetchItems()
        categories = coreData.categories
        callback?()
    }
}

