//
//  CarType+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Ayan on 22.10.23.
//
//

import Foundation
import CoreData


extension CarType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarType> {
        return NSFetchRequest<CarType>(entityName: "CarType")
    }

    @NSManaged public var carPrice: String?
    @NSManaged public var carEngine: String?
    @NSManaged public var carModel: String?
    @NSManaged public var brandName: String?
    @NSManaged public var carImage: String?

}

extension CarType : Identifiable {

}
