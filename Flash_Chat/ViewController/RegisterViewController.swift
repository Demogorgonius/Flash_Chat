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
    }
    
    
}

extension RegisterViewController: RegisterViewDelegate {
    func registerView(registerTapped sender: UIButton) {
        
    }
    
    func registerView(backButtonTapped sender: UIButton) {
        
    }
    
}
