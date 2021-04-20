//
//  AccountController.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//
import UIKit
import Firebase

protocol AccountControllerDelegate: class {
    func handleMenuToggle(forMenuOption: MenuOption?)
}

class AccountController: UIViewController {
    //MARK: Properties
    weak var delegate: AccountControllerDelegate?
    
    var tableView = UITableView()
    private let cellId = "account menu cell"
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: Selectors
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    //MARK: Helper functions
    func configureUI() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Profile:
            print("profile...")
        case .Logout:
            let alert = UIAlertController(title: "", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {_ in self.signOut()
                            
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            
        case .Settings:
            let controller = SettingsController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        }
    }
}

//MARK: Table view datasource and delegate
extension AccountController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuOptionCell
        
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuOption = MenuOption(rawValue: indexPath.row) else {return}
        delegate?.handleMenuToggle(forMenuOption: menuOption)
        didSelectMenuOption(menuOption: menuOption)
        
    }
    
    
    
    
}
