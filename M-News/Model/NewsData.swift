//
//  NewsData.swift
//  M-News
//
//  Created by Julius on 11/04/2021.
//

import Foundation

struct NewsData: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]
}
