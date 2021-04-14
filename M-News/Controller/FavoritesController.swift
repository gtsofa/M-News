//
//  FavoritesController.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import UIKit
import CoreData

class FavoritesController: UIViewController {
    
    //MARK: Properties
    let context = CoreDataManager.sharedInstance.context
    let newsData = CoreDataManager.sharedInstance.newsCoreData
    let fetchRequest = CoreDataManager.sharedInstance.loadArticles()
    
    var fetchedResultController = NSFetchedResultsController<NSFetchRequestResult>()
    
    let tableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFetchResults()
        configureTableView()
        view.backgroundColor = .white
        //navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: Helper function
    func getFetchResults() {
        //fetchedResultController = getResultFetched
        fetchedResultController.delegate = self
        do {
            try fetchedResultController.performFetch()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: table datasource + delegate

extension FavoritesController: UITableViewDataSource, UITableViewDelegate,NSFetchedResultsControllerDelegate {
    
    func getResultFetchedResultController()->NSFetchedResultsController<NSFetchRequestResult>{
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let numberOfSections = fetchedResultController.sections?.count ?? 0
        return numberOfSections
    }
    
     func prepare(for segue: UIStoryboardSegue, sender:UITableViewCell) {
        let indexPath = tableView.indexPath(for: sender)
        let task: News = fetchedResultController.object(at: indexPath ?? []) as! News
        
        if segue.identifier == "articles2"{
            let destinationController = segue.destination as! FavoritedViewController
            destinationController.website = task
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let indexPath = tableView.indexPath(for: sender)
        let task: News = fetchedResultController.object(at: indexPath ) as! News
        
        let destinationController = FavoritedViewController()
        destinationController.website = task
        navigationController?.pushViewController(destinationController, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionNumbers = fetchedResultController.sections?[section].numberOfObjects ?? 0
        return sectionNumbers
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! FavoriteTableViewCell //SaveTableViewCell
        let news = fetchedResultController.object(at: indexPath as IndexPath) as! News
        cell.authorName.text = news.unwrappedAuthor.trunc(length: 21)
        cell.headLine.text = news.unwrappedmyDescription.trunc(length: 82)
        cell.timePublication.text = news.unwrappedPublishedAt.convertToDisplayFormat()
        cell.newsImage.downloadImage(from: news.urlImage ?? "")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let managedObject = fetchedResultController.object(at: indexPath) as! NSManagedObject
            context.delete(managedObject)
            do{
                try context.save()
            }catch _ {
                
            }
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
}


/*
extension FavoritesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionNumbers = fetchedResultController.sections?[section].numberOfObjects ?? 0
        return sectionNumbers
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

// MARK: ns fetch
extension FavoritesController: NSFetchedResultsControllerDelegate {
    
}*/
