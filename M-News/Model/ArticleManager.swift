//
//  ArticleManager.swift
//  M-News
//
//  Created by Julius on 13/04/2021.
//

import Foundation

class ArticleManager {
    var articles: [ArticlesData]? = []
    var baseUrl = "https://newsapi.org/v2/everything?q=covid&sortBy=popularity"
    var apiKey = "&apiKey=3c1e7890bc03419a8628fdfb2e05cc90&"
    
    func performRequest(page: Int) {
        let endPoint = baseUrl + apiKey + "pageSize=20&page=\(page)"
        guard let artictleUrl = URL(string: endPoint) else {
            print("Invalid Url")
            return
        }
        let request = URLRequest(url: artictleUrl)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) -> Void in
            guard let self = self else {return }
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            if let data = data {self.articles = self.parseData(data: data)}})
        task.resume()
    }
    
    func parseData(data: Data) -> [ArticlesData]? {
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            let jsonArticles = jsonResult?["articles"] as? [AnyObject] ?? []
            
            print("okay: \(jsonArticles)")
            
            for jsonArticle in jsonArticles {
                let article = ArticlesData()
                article.author = jsonArticle["author"] as? String
                article.myDescription = jsonArticle["description"] as? String
                article.publishedAt = jsonArticle["publishedAt"] as? String
                article.urlImage = jsonArticle["urlToImage"] as? String
                article.urlWebsite = jsonArticle["url"] as? String
                articles?.append(article)
            }
            articles?.sort(by: { $0.publishedAt! > $1.publishedAt! })
            
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name("didFinishParsing"), object: nil)
        }
        catch {
            print("\(error)")
        }
        return articles ?? []
        
    }
    
}
