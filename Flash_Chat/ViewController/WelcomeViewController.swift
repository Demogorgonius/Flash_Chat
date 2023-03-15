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
    
    
}

extension WelcomeViewController: WelcomeViewDelegate {
    
    func welcomeView(loginTapped button: UIButton) {
        
    }
    
    func welcomeView(registerTapped button: UIButton) {
        let registerViewController = RegisterViewController()
        registerViewController.modalPresentationStyle = .fullScreen
         present(registerViewController, animated: true)
    }
    
}
