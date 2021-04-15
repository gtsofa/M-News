//
//  DashboardController.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import UIKit
import CoreData

class DashboardController: UIViewController {
    //MARK: Properties
    var urlSelected = ""
    
    var news = ArticleManager()
    var tableView = UITableView()
    var page = 1
    fileprivate let cellId = "dashboard tb cell"
    
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        news.performRequest(page: page)
        configureUI()
        //configureTableview()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTableView), name: Notification.Name("didFinishParsing"), object: nil)
    }
    
    @objc func refreshTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //MARK: Helper functions
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController?.isNavigationBarHidden = true
        //title = "Latest News"
        configureTableview()
    }
    
    func configureTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: cellId)
        //tableView.rowHeight = 150
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

//MARK: Table datasource and delegate
extension DashboardController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            let offsetY         = scrollView.contentOffset.y
            let contentHeight   = scrollView.contentSize.height
            let height          = scrollView.frame.size.height
           
            if offsetY > contentHeight - height {
                page+=1
                news.performRequest(page: page)
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return news.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsTableViewCell
        let stories = news.articles
        var news: ArticlesData
        
        news = stories![indexPath.row]
        cell.authorName.text = news.unwrappedAuthor.trunc(length: 15)
        cell.headLine.text = news.unwrappedmyDescription.trunc(length: 100)
        cell.newsImage.downloadImage(from: news.urlImage ?? " ")
        cell.timePublication.text = news.unwrappedPublishedAt.convertToDisplayFormat()
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favorite = UIContextualAction(style: .normal, title: "Favorite") { (_, _, completionHandler) in
            completionHandler(true)
            guard let article = self.news.articles?[indexPath.row] else {return}
            CoreDataManager.sharedInstance.saveArticle(article: article)
            
            //let controller = FavoritesController()
            //self.navigationController?.pushViewController(controller, animated: true)
            
            self.alert(message:"", title: "Saved")
        }
        
        favorite.backgroundColor = .systemBlue
        let swipe = UISwipeActionsConfiguration(actions: [favorite])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        print("selected for action...")
        
        /*let website = news.articles?[indexPath.row].unwrappedUrlWebsite
        let activityViewController = UIActivityViewController(activityItems: [website ?? ""], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)*/
        
        //let website = news.articles?[indexPath.row].unwrappedUrlWebsite
        let stories = news.articles
        let destinationController = ArticleViewController()
        destinationController.website = stories![(tableView.indexPathForSelectedRow?.row)!]
        navigationController?.pushViewController(destinationController, animated: false)

    }

}
