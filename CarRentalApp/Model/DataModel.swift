//
//  DataModel.swift
//  CarRentalApp
//
//  Created by Ayan on 22.10.23.
//

import Foundation

//public enum CarCategory: String, CaseIterable {
//    case standart
//    case prestige
//    case suv
//    case econom
//}

struct CategoryModel {
    let name: String
    let image: String
    let size: String
}

struct CarModel {
    let image: String
    let price: String
    let name: String
    let engine: String
    let category: CategoryModel
}
