//
//  DataModel.swift
//  CarRentalApp
//
//  Created by Ayan on 22.10.23.
//

import Foundation
enum CarCategory: CaseIterable {
    case standart
    case prestige
    case Suv
    case econom
}
struct CarModel {
    let price: String
    let name: String
    let engine: String
    let category: CarCategory
}
