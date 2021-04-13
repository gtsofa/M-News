//
//  NewsFeed.swift
//  M-News
//
//  Created by Julius on 09/04/2021.
//

import Foundation

struct NewsFeed: Decodable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}
