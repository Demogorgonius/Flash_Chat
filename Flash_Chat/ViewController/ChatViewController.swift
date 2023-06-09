//
//  ChatViewController.swift
//  Flash_Chat
//
//  Created by Sergey on 16.03.2023.
//

import Foundation
import UIKit
import Firebase

class ChatViewController: CustomViewController<ChatView> {

    var tableView: UITableView!
    
    let db = Firestore.firestore()
    
    var isMe = false
    let defaults = UserDefaults.standard
    
    var messages: [Message] = [
//        Message(sender: "test@test.ru", body: "Hey! sdfsdfs d sdfsdfsdf wefwefkofkop koosdkfgokolwdff km"),
//        Message(sender: "1@1.ru", body: "Hello!!! rrgefrv  ef ef kmef mk eflmk mff bmklmemf ml"),
//        Message(sender: "1@1.ru", body: "Hello!!! rrgefrv  ef efdfgdfgdfgdfg dfgd fg dfg df gdfgf ml"),
//        Message(sender: "test@test.ru", body: "Hey! sdfsdfs dfgnbf gr45434t fgn f jrfgnh")
    ]
    
    override func loadView() {
        super.loadView()
        view = ChatView()
        tableView = ChatTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        loadMessageFromServer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func loadMessageFromServer() {
        
        
        
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { querySnapshot, error in
            
            self.messages = []
            
            if let error = error {
                self.showErrorAlert(error: error, message: nil)
            } else {
                if let queryDocuments = querySnapshot?.documents {
                    for document in queryDocuments {
                        let data  = document.data()
                        if let sender = data[K.FStore.senderField] as? String,
                           let messageBody = data[K.FStore.bodyField] as? String {
                            self.messages.append(Message(sender: sender, body: messageBody))
                            
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.customView.tableView.reloadData()
                        if self.messages.count != 0 {
                            let indexPath = IndexPath(row: self.messages.count - 1 , section: 0)
                            self.customView.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                        }
                       
                    }
                    
                }
            }
        }
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

extension ChatViewController: ChatViewDelegate {
    func chatView(sendMessageButtonTapped button: UIButton) {
        
        if let messageBody = customView.messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender,
                                                                      K.FStore.bodyField: messageBody,
                                                                      K.FStore.dateField: Date().timeIntervalSince1970]) { error in
                if let error = error {
                    self.showErrorAlert(error: error, message: nil)
                } else {
                    print ("Successfully saved data.")
                    
                    DispatchQueue.main.async {
                        self.customView.messageTextField.text = ""
                        self.tableView.reloadData()
                    }
                    
                }
            }
        }
        
    }
    
    func chatView(backButtonTapped button: UIButton) {
        do {
            try Auth.auth().signOut()
            let welcomeVC = WelcomeViewController()
            welcomeVC.modalPresentationStyle = .fullScreen
            present(welcomeVC, animated: true)
        } catch {
            let error = error
            showErrorAlert(error: error, message: nil)
        }
        
        
        
    }
    
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.reuseID, for: indexPath)
        guard let newCell = cell as? ChatTableViewCell else {
            return cell
        }
        let user = messages[indexPath.row].sender
        let body = messages[indexPath.row].body
        
        if let curUser = defaults.object(forKey: "user") as? String {
            if curUser == user {
                isMe = true
                
            } else {
                isMe = false
               
            }
        } else {
            isMe = false
            
        }
        
        newCell.configureCell(message: body, user: user, isMe: isMe)
        return newCell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}



