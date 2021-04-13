//
//  News.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import Foundation

struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}
