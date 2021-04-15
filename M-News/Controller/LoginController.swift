//
//  LoginController.swift
//  M-News
//
//  Created by Julius on 06/04/2021.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
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
        return tf
        }()
    
    private lazy var passwordText: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.setLeftPaddingPoints(10)
        tf.isSecureTextEntry = true
        return tf
        }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
        }()
    
    private let resetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Reset Password", for: .normal)
        button.addTarget(self, action: #selector(resetPassword), for: .touchUpInside)
        return button
        }()
    
    private let createAccount: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(signup), for: .touchUpInside)
        return button
        }()
    
    private lazy var  separatorLabel: UILabel = {
        let quick = UILabel()
        quick.text = "|"
        quick.font = UIFont.systemFont(ofSize: 15)
        quick.widthAnchor.constraint(equalToConstant: 5).isActive = true
        return quick
        }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: Helper functions
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 80, paddingLeft: 16, paddingRight: 16)
        
        let loginStack = UIStackView(arrangedSubviews: [emailText, passwordText, loginButton])
        loginStack.axis = .vertical
        loginStack.distribution = .fillEqually
        loginStack.spacing = 16
        view.addSubview(loginStack)
        loginStack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(separatorLabel)
        separatorLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 260, paddingLeft: 150, paddingRight: 16)
        
        let register = UIStackView(arrangedSubviews: [createAccount, resetPasswordButton])
        register.axis = .horizontal
        register.distribution = .fillEqually
        register.spacing = 10
        view.addSubview(register)
        register.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 250, paddingLeft: 16, paddingRight: 50)
        
    }
    
    @objc func login() {
        guard let email = emailText.text else { return }
        guard let password = passwordText.text else { return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to log user in with error \(error.localizedDescription)")
                return
            }
            print("Successfully logged user in..")
            guard let controller = UIApplication.shared.keyWindow?.rootViewController as? HomeController else { return}
            
            let prova = "hadi hapo..."
            controller.comingArticles = prova
            controller.configureUI()
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func resetPassword() {
        print("reset my password pls...")
        let controller = ResetPasswordController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @objc func signup() {
        let controller = SignUpController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
