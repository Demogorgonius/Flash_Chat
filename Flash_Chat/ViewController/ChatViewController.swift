//
//  ChatViewController.swift
//  Flash_Chat
//
//  Created by Sergey on 16.03.2023.
//

import Foundation
import UIKit

class ChatViewController: CustomViewController<ChatView> {

    
    
    var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        view = ChatView()
        tableView = ChatTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}



extension ChatViewController {
    func showErrorAlert(error: Error?, message: String?) {
        
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default) { alertAction in
            return
        }
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
}

