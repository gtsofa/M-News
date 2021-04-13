//
//  ArticlesData.swift
//  M-News
//
//  Created by Julius on 13/04/2021.
//

import Foundation

class ArticlesData: NSObject {
    var author: String?
    var title: String?
    var myDescription: String?
    var publishedAt: String?
    var urlImage:String?
    var urlWebsite: String?
}

extension ArticlesData {
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
