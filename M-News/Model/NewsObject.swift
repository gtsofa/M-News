//
//  NewsObject.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import Foundation

struct NewsObject: Decodable {
    let status: String?
    let totalResults: String?
    let articles: [News]
}
