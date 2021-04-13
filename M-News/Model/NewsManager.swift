//
//  NewsManager.swift
//  M-News
//
//  Created by Julius on 11/04/2021.
//

import Foundation

protocol NewsManagerDelegate {
    func didUpdateNewsArticle(_ newsManager: NewsManager, newsArticle: ArticleModel)
    func didFailWithError(error: Error)
}

struct NewsManager {
    
    let newsURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=3c1e7890bc03419a8628fdfb2e05cc90"
    
    var delegate: NewsManagerDelegate?
    
    //fetch data
    func fetchNews() {
        let urlString = "\(newsURL)"
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let newsArticle = self.parseJSON(safeData) {
                        //update ui
                        self.delegate?.didUpdateNewsArticle(self, newsArticle: newsArticle)
                    }
                    
                }
            }
            task.resume()
            
        }
    }
    //parseJson
    func parseJSON(_ newsData: Data) -> ArticleModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NewsData.self, from: newsData)
            let allArticles = decodedData.articles
            print("#: \(allArticles.count)")
            var title: String?
            var urlToImage: String?
            var publishedAt: String?
            var content: String?
            
            
            for singleArticle in allArticles {
                title = singleArticle.title
                guard let contentvale = singleArticle.description else {return nil }
                content = contentvale
                urlToImage = singleArticle.urlToImage
                publishedAt = singleArticle.publishedAt
                
                
            }
            
            //print("zosi: \(allArticles)")
        
            //print("title: \(title!)")
            //print("description: \(String(describing: description))")
            //print("publishedAt: \(String(describing: publishedAt))")
            
            let newsArticle = ArticleModel(title: title!, urlToImage: urlToImage!, publishedAt: publishedAt!, content: content!)
            
            //print("woow: \(newsArticle)")
            return newsArticle
            
        } catch  {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
    
}
