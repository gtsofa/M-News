//
//  DashboardController.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import UIKit

class DashboardController: UIViewController {
    //MARK: Properties
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: Helper function
    func configureUI() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
    }
    
}
