//
//  HomeController.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    //MARK: Properties
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: Helper functions
    func configureUI() {
        checkIfUserIsLoggedIN()
        //signOut()
        view.backgroundColor = .red
    }
    
    func checkIfUserIsLoggedIN() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                self.present(nav, animated: true, completion: nil)
            }
            
        }
        else {
            print("DEBUG: User id is \(Auth.auth().currentUser?.uid)")
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
