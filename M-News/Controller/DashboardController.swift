//
//  DashboardController.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import UIKit

class DashboardController: UIViewController {
    //MARK: Properties
    var incomingdashboard = ""
    var tableView = UITableView()
    private let cellid = "dashboard cell id"
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getNews { (news) in
            guard let news = news else {return }
            print("\(news[0].title)")
        }
        configureUI()
    }
    
    //MARK: Helper function
    func configureUI() {
        
        print("hello...\(incomingdashboard) is....")
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        configureTableview()
    }
    
    func configureTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

//MARK: Table view datasource and delegate
extension DashboardController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
