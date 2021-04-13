//
//  NewsArticle.swift
//  M-News
//
//  Created by Julius on 12/04/2021.
//

import Foundation

struct ArticleResponse: Codable {
    let totalResults: Int
    let articles: [ArticleDetail]
}

/*struct Articles: Codable {
    let articles: [ArticleDetail]
}*/

struct ArticleDetail: Codable {
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
}
