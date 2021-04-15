//
//  HomeController.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import UIKit
import Firebase

class HomeController: UITabBarController {
    //MARK: Properties
    var comingArticles = ""
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIN()
    }
    
    //MARK: Helper functions
    func configureUI() {
        let controller = DashboardController()
        
        let dashboardController = UINavigationController(rootViewController: controller)
        
        let favoritesController = UINavigationController(rootViewController: FavoritesController())
        let accountController = UINavigationController(rootViewController: AccountController())
        
        viewControllers = [dashboardController, favoritesController, accountController]
        
        let item1 = UITabBarItem()
        item1.title = "DASHBOARD"
        item1.image = UIImage(named: "no images")
        
        let item2 = UITabBarItem(title: "FAVORITES", image: UIImage(named: "FAV IMAGES"), tag: 1)
        let item3 = UITabBarItem(title: "ACCOUNT", image: UIImage(named: "ACCOUNT"), tag: 2)
        dashboardController.tabBarItem = item1
        favoritesController.tabBarItem = item2
        accountController.tabBarItem = item3
        
        
        UITabBar.appearance().tintColor = .systemBlue
    }
    
    func checkIfUserIsLoggedIN() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                
                self.present(nav, animated: true, completion: nil)
            }
            
        }
        else {
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    //MARK: Selectors
    @objc func handleMenuToggle() {
    }
}
