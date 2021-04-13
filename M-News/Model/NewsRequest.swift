//
//  NewsRequest.swift
//  M-News
//
//  Created by Julius on 12/04/2021.
//

import Foundation

enum NewsError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct NewsRequest {
    let newsURL: URL
    let API_KEY = "3c1e7890bc03419a8628fdfb2e05cc90"
    
    init(aPIKey: String) {
        
        let resourceString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(API_KEY)"
        guard let resourceURL =  URL(string: resourceString) else { fatalError()}
        
        self.newsURL = resourceURL
    }
    
    func fetchNews(completion: @escaping(Result<[ArticleDetail], NewsError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: newsURL) { (data, response, error) in
            guard let jsonData = data else {completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let newsResponse = try decoder.decode(ArticleResponse.self, from: jsonData)
                let articleDetails = newsResponse.articles
                completion(.success(articleDetails))
                
                
            } catch {
                completion(.failure(.canNotProcessData ))
            }
            
        }
        dataTask.resume()
                    
    }
}
