//
//  Books+CoreDataProperties.swift
//  Bookwarm
//
//  Created by administrator on 10/07/2021.
//
//

import Foundation
import CoreData


extension Books {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Books> {
        return NSFetchRequest<Books>(entityName: "Books")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var rating: String?
    @NSManaged public var genre: String?
    @NSManaged public var author: String?
    @NSManaged public var title: String?

}

extension Books : Identifiable {

}
