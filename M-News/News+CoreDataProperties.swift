//
//  News+CoreDataProperties.swift
//  
//
//  Created by Julius on 14/04/2021.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var author: String?
    @NSManaged public var myDescription: String?
    @NSManaged public var publishAt: String?
    @NSManaged public var title: String?
    @NSManaged public var urlImage: String?
    @NSManaged public var urlWebsite: String?

}
