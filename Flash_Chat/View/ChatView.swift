//
//  ChatView.swift
//  Flash_Chat
//
//  Created by Sergey on 16.03.2023.
//

import Foundation
import UIKit
import SnapKit

protocol ChatViewDelegate: AnyObject {
    
    func chatView(sendMessageButtonTapped button: UIButton)
    
}

class ChatView: CustomView {
    
    //MARK: - Variables
    
    var delegate: ChatViewDelegate?
    var tableView: UITableView!
    
    //MARK: - UIStackView/UIView
    
    lazy var sendMessageView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 60))
        view.backgroundColor = UIColor(named: "BrandPurple")
        return view
    }()
    
    //MARK: - UITextField
    
    lazy var messageTextField: UITextField = {
        let text = UITextField(frame: CGRect(x: 0, y: 0, width: 314, height: 40))
        text.placeholder = "Message..."
        text.indent(size: 15)
        text.borderStyle = .none
        text.backgroundColor = .white
        text.layer.cornerRadius = 10.0
        text.layer.masksToBounds = true
        return text
    }()
    
    //MARK: - UIButton
    
    lazy var sendMessageButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        let configuration = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "paperplane.fill", withConfiguration: configuration)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(sendMessageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - UITableView
    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        return tableView
//    }()
    
    
    
    
    override func setupViews() {
        super.setupViews()
        
        tableView = ChatTableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        backgroundColor = UIColor(named: "BrandPurple")
        addSubview(tableView)
        addSubview(sendMessageView)
        sendMessageView.addSubview(messageTextField)
        sendMessageView.addSubview(sendMessageButton)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        setupConstraints()
        
    }
    
   
    
}

extension ChatView {

    func setupConstraints() {
        
        sendMessageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(60)
        }
        
        messageTextField.snp.makeConstraints { make in
            make.width.equalTo(314)
            make.height.equalTo(40)
            make.leading.equalTo(sendMessageView.snp.leading).offset(20)
            make.top.equalTo(sendMessageView.snp.top).offset(20)
        }
        
        sendMessageButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.trailing.equalTo(sendMessageView.snp.trailing).offset(-10)
            make.top.equalTo(sendMessageView.snp.top).offset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(sendMessageView.snp.top)
        }
        
        
    }
    
    @objc func sendMessageButtonTapped(_ sender: UIButton) {
        
        
    }
    
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

extension ChatView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.reuseID, for: indexPath)
        guard let newCell = cell as? ChatTableViewCell else {
            
            return cell
        }
        return newCell
    }
    
    
}
