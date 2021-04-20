//
//  ContainerController.swift
//  M-News
//
//  Created by Julius on 20/04/2021.
//

import UIKit
import Firebase


class ContainerController: UIViewController {
    // MARK: Properties
    
    private let homeController = HomeController()
    private var menuController: MenuController!
    private var isExpanded = false
    private let blackView = UIView()
    private lazy var xOrigin = self.view.frame.width - 80
    // MARK: life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        //checkIfUserIsLoggedIn()
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    // MARK: Selectors
    @objc func dismissMenu() {
        isExpanded = false
        //animateMenu(shouldExpand: isExpanded)
    }
    
    // MARK: API
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            presentLoginController()
        } else {
            configure()
        }
    }
    // MARK: Helper functions
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            presentLoginController()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    func presentLoginController() {
        DispatchQueue.main.async {
            let nav = UINavigationController(rootViewController: LoginController())
            if #available(iOS 13.0, *) {
                nav.isModalInPresentation = true
            }
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    
    func configure() {
        view.backgroundColor = .white
        configureHomeController()
    }
    
    func configureHomeController() {
        addChild(homeController)
        homeController.didMove(toParent: self)
        view.addSubview(homeController.view)
        //homeController.delegate = self
    }
}

