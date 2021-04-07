//
//  SignUpController.swift
//  M-News
//
//  Created by Julius on 06/04/2021.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    //MARK: Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "M-News"
        label.textAlignment = .center
        return label
        }()
    
    private lazy var emailText: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.setLeftPaddingPoints(10)
        //tf.layer.cornerRadius = 20
        //tf.backgroundColor = .lightGray
        return tf
        }()
    
    private lazy var fullnameText: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Fullname"
        tf.setLeftPaddingPoints(10)
        //tf.layer.cornerRadius = 20
        //tf.backgroundColor = .lightGray
        return tf
        }()
    
    private lazy var passwordText: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.setLeftPaddingPoints(10)
        //tf.layer.cornerRadius = 20
        //tf.backgroundColor = .lightGray
        return tf
        }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("SIGN UP", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(register), for: .touchUpInside)
        return button
        }()
    
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: Help functions
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 80, paddingLeft: 16, paddingRight: 16)
        
        let register = UIStackView(arrangedSubviews: [emailText, fullnameText, passwordText])
        register.axis = .vertical
        register.distribution = .fillEqually
        register.spacing = 10
        view.addSubview(register)
        register.anchor(top: titleLabel.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 16, paddingRight: 50)
        
        view.addSubview(registerButton)
        registerButton.anchor(top: register.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 16, paddingRight: 16)
    }
    
    @objc func register() {
        guard let email = emailText.text else { return }
        guard let fullname = fullnameText.text else { return }
        guard let password = passwordText.text else { return}
    
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to register user with error \(error.localizedDescription)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            let values = ["email": email, "fullname": fullname]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values) { (error, ref) in
                print("Successfully registered user and saved the data...")
            }
            
        }
    }
}
