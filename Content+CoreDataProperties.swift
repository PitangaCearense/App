//
//  Content+CoreDataProperties.swift
//  App
//
//  Created by José João Silva Nunes Alves on 27/05/21.
//
//

import Foundation
import CoreData


extension Content {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Content> {
        return NSFetchRequest<Content>(entityName: "Content")
    }

    @NSManaged public var author: String?
    @NSManaged public var data: String?
    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var resource: String?
    @NSManaged public var type: Int16
    @NSManaged public var identifier: UUID?

}

extension Content : Identifiable {

}
