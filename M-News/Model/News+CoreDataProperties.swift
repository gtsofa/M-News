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
    @NSManaged public var publishedAt: String?
    @NSManaged public var title: String?
    @NSManaged public var urlImage: String?
    @NSManaged public var urlWebsite: String?

}

extension News{
    var unwrappedAuthor: String {
        "\(author ?? "Unavailable")"
    }
    
    var unwrappedTitle: String {
        "\(title ?? "Unavailable")"
    }
    
    var unwrappedmyDescription: String {
        "\(myDescription ?? "Unavailable")"
    }
    
    var unwrappedPublishedAt: String {
        "\(publishedAt ?? "Unavailable")"
    }
    
    var unwrappedUrlWebsite: String {
        "\(urlWebsite ?? "Unavailable")"
    }
}
