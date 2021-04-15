//
//  CoreDataManager.swift
//  M-News
//
//  Created by Julius on 14/04/2021.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    static let sharedInstance = CoreDataManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var newsCoreData: [News] = []
    var article = ArticlesData()
    
    // MARK: Core Data Saving Support
    func saveArticle(article: ArticlesData) {
        let news = News(context: context)
        
        news.setValue("\(article.author ?? "")", forKeyPath: "author")
        news.setValue("\(article.myDescription ?? "")", forKeyPath: "myDescription")
        news.setValue("\(article.publishedAt ?? "")", forKeyPath: "publishedAt")
        news.setValue("\(article.title ?? "")", forKeyPath: "title")
        news.setValue("\(article.urlImage ?? "")", forKeyPath: "urlImage")
        news.setValue("\(article.urlWebsite ?? "")", forKeyPath: "urlWebsite")
        
        do {
            try context.save()
        } catch let error {
            print("Failed to create Person: \(error.localizedDescription)")
        }
    }
    
    func loadArticles() -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        fetchRequest.fetchLimit = newsCoreData.count
        let sortDescriptor = NSSortDescriptor(key: "publishedAt", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    func printCoreDataDBPath() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        print("Core Data DB Path: \(path ?? "Not found")")
        
    }
    
}
