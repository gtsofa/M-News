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
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIN()
        //signOut()
    }
    
    //MARK: Helper functions
    func configureUI() {
        view.backgroundColor = .green
        navigationItem.title = "Dashboards"
        let dashboardController = UINavigationController(rootViewController: DashboardController())
        let favoritesController = UINavigationController(rootViewController: FavoritesController())
        
        viewControllers = [dashboardController, favoritesController]
        
        let item1 = UITabBarItem()
        item1.title = "DASHBOARD"
        item1.image = UIImage(named: "no images")
        
        let item2 = UITabBarItem(title: "FAVORITES", image: UIImage(named: "FAV IMAGES"), tag: 1)
        dashboardController.tabBarItem = item1
        favoritesController.tabBarItem = item2
        
        UITabBar.appearance().tintColor = .mainAmber
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
}
