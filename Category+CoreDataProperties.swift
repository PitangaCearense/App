//
//  Category+CoreDataProperties.swift
//  App
//
//  Created by José João Silva Nunes Alves on 26/05/21.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var selecteds: [Int]?

}

extension Category : Identifiable {

}
