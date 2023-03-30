//
//  WelcomeViewController.swift
//  Flash_Chat
//
//  Created by Sergey on 13.03.2023.
//

import Foundation
import UIKit

class WelcomeViewController: CustomViewController<WelcomeView> {
    
    override func loadView() {
        view = WelcomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customView.titleLabel.text = ""
        let string = "⚡️FlashChat"
        var timer = 0
        for char in string {
            DispatchQueue.main.asyncAfter(deadline: .now() + .microseconds(timer), execute: {
                self.customView.configureTitleLabel(text: char)
                
            })
            timer += 100000
        }
    }
    
    
}

extension WelcomeViewController: WelcomeViewDelegate {
    
    func welcomeView(loginTapped button: UIButton) {
        
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true)
//        let chatVC = ChatViewController()
//        UserDefaults.standard.set("test@test.ru", forKey: "user")
//        chatVC.modalPresentationStyle = .fullScreen
//        present(chatVC, animated: true)
        
    }
    
    func welcomeView(registerTapped button: UIButton) {
        let registerViewController = RegisterViewController()
        registerViewController.modalPresentationStyle = .fullScreen
         present(registerViewController, animated: true)
    }
    
}
