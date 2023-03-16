//
//  RegisterViewController.swift
//  Flash_Chat
//
//  Created by Sergey on 14.03.2023.
//

import Foundation
import UIKit

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
        let chatVC = ChatViewController()
        chatVC.modalPresentationStyle = .fullScreen
        present(chatVC, animated: true)
    }
    
    func registerView(backButtonTapped sender: UIButton) {
        
    }
    
}
