//
//  SearchViewModel.swift
//  CarRentalApp
//
//  Created by Ayan on 03.11.23.
//

import Foundation

class SearchViewModel {
    private let coreData: CoreData
    var items: [CarList] = []
    var itemsDidChange: (()->Void)?
    
    
    init(coreData: CoreData) {
        self.coreData = coreData
    }
    
    func fetchItems() {
        coreData.fetchItems()
        items = coreData.items
        itemsDidChange?()
    }
    
    func filterItems (with searchText: String) {
        if searchText.isEmpty {
            items = coreData.items
        } else {
            items = coreData.items.filter{ carItem in
                return (carItem.category?.lowercased() ?? "").contains(searchText.lowercased()) ||
                (carItem.name?.lowercased() ?? "").contains(searchText.lowercased())
            }
        }
        itemsDidChange?()
    }    
}
