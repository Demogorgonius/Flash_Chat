//
//  RegisterViewController.swift
//  Flash_Chat
//
//  Created by Sergey on 14.03.2023.
//

import Foundation
import UIKit
import Firebase

class RegisterViewController: CustomViewController<RegisterView> {
    override func loadView() {
        view = RegisterView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
    }
    
    
}

extension RegisterViewController: RegisterViewDelegate {
    func registerView(registerTapped sender: UIButton) {
        
        if let email = customView.emailTextField.text, let password = customView.passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password){authResult, error in
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
    
    func registerView(backButtonTapped sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension RegisterViewController {
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
