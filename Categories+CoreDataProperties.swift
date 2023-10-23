//
//  Categories+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Ayan on 23.10.23.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var name: String?
    @NSManaged public var size: String?
    @NSManaged public var image: String?

}

extension Categories : Identifiable {

}
