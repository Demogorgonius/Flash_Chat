//
//  LoginViewController.swift
//  Flash_Chat
//
//  Created by Sergey on 15.03.2023.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: CustomViewController<LoginView> {
    
    override func loadView() {
        super.loadView()
        
        view = LoginView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        
    }
    
}

extension LoginViewController: LoginViewDelegate {
    func loginView(loginButtonTapped button: UIButton) {
        if let email = customView.emailTextField.text, let password = customView.passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                if let error = error {
                    self.showErrorAlert(error: error, stringMessage: nil)
                } else {
                    let chatVC = ChatViewController()
                    chatVC.modalPresentationStyle = .fullScreen
                    self.present(chatVC, animated: true)
                }
            }
        }
    }
    
    func loginView(backButtonTapped button: UIButton) {
        dismiss(animated: true)
    }
    
    func showErrorAlert(error: Error?, stringMessage: String?) {
        var message: String = ""
        if let error = error {
            message = error.localizedDescription
        }
        if let stringMessage = stringMessage {
            message = stringMessage
        }
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default) { alertAction in
            return
        }
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    
}
