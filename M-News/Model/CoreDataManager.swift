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
    
    //private override init() {}
    
    var newsCoreData: [News] = []
    var article = ArticlesData()
    
    // MARK: Core Data Saving Support
    func createData() {
        
        //Since we know that the container is set up in the AppDelegates so we need to refer to it
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Now let us create an entity and new user records
        let newsEntity = NSEntityDescription.entity(forEntityName: "News", in: managedContext)!
        
        for article in newsCoreData {
            let news = NSManagedObject(entity: newsEntity, insertInto: managedContext)
            
            news.setValue("Tsofa\(article.author ?? "")", forKeyPath: "author")
            news.setValue("Tsofa\(article.myDescription ?? "")", forKeyPath: "myDescription")
            news.setValue("Tsofa\(article.publishAt ?? "")", forKeyPath: "publishAt")
            news.setValue("Tsofa\(article.title ?? "")", forKeyPath: "title")
            news.setValue("Tsofa\(article.urlImage ?? "")", forKeyPath: "urlImage")
            news.setValue("Tsofa\(article.urlWebsite ?? "")", forKeyPath: "urlWebsite")

        }
        
        //Now we have set all the values. The next step is to save them inside the Core Data.
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
    }
    
    
}
