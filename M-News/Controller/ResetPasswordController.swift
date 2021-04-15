//
//  ResetPasswordController.swift
//  M-News
//
//  Created by Julius on 15/04/2021.
//

import UIKit
import Firebase

class ResetPasswordController: UIViewController {
    // MARK: Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Reset Password"
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("RESET PASSWORD", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(resetPass), for: .touchUpInside)
        return button
        }()
    
    // MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Helper functions
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 80, paddingLeft: 16, paddingRight: 16)
        
        let loginStack = UIStackView(arrangedSubviews: [emailText, loginButton])
        loginStack.axis = .vertical
        loginStack.distribution = .fillEqually
        loginStack.spacing = 16
        view.addSubview(loginStack)
        loginStack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 16, paddingRight: 16)
    }
    
    // MARK: Selectors
    @objc func resetPass() {
        guard let email = emailText.text, email != "" else {
            alert(message: "", title: "Please enter an email address for password reset.")
            return
        }
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil {
                print("on success")
                self.view.endEditing(true)
                self.navigationController?.popViewController(animated: false)
                self.alert(message: "", title: "We have just sent you a password reset email. Please check your inbox and follow the instructions to reset your password.")
            }
            else {
                //print("\(error?.localizedDescription)")
                self.alert(message: "", title: "\(String(describing: error?.localizedDescription))")
                
            }
        }
    }
    
}
