//
//  ChatTableViewCell.swift
//  Flash_Chat
//
//  Created by Sergey on 16.03.2023.
//

import Foundation
import UIKit
import SnapKit
import Firebase

class ChatTableViewCell: UITableViewCell {
    
    static let reuseID = "ChatCell"
    
    var isMe: Bool = false
    
    lazy var messageView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        view.backgroundColor = UIColor(named: "BrandLightBlue")
        view.layer.cornerRadius = 25
        return view
    }()
    
    
    lazy var avatarImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        image.image = UIImage(systemName: "person.crop.square")
        return image
    }()
    
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "message hsgfdhdfg sghdfgh  sfgfhdfg sghdsertyh sth wet wetyeqth"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .light, width: .condensed)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setViews() {
        clipsToBounds = false
        contentView.addSubview(messageView)
        messageView.addSubview(messageLabel)
        messageView.addSubview(avatarImage)
    }
    
    func layoutViews() {
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(messageView.snp.top).offset(5)
            make.leading.equalTo(messageView.snp.leading).offset(15)
            make.trailing.equalTo(messageView.snp.trailing).offset(-45)
            make.bottom.equalTo(messageView.snp.bottom).offset(-5)
        }
        
        avatarImage.snp.makeConstraints { make in
            make.top.equalTo(messageView.snp.top).offset(5)
            make.trailing.equalTo(messageView.snp.trailing).offset(-5)
            make.height.equalTo(30)
        }
        
    }
    
    func configureCell(message: String, user: String) {
        if checkIsMe() {
            isMe = true
            avatarImage.image = UIImage(named: "MeAvatar")
            messageView.snp.makeConstraints { make in
                make.height.equalTo(messageLabel.snp.height).offset(10)
                make.width.equalTo(300)
                make.leading.equalTo(90)
                make.top.equalToSuperview().offset(5)
            }
        } else {
            isMe = false
            messageView.snp.makeConstraints { make in
                make.height.equalTo(messageLabel.snp.height).offset(10)
                make.width.equalTo(300)
                make.leading.equalTo(15)
                make.top.equalToSuperview().offset(5)
            }
        }
        messageLabel.text = message
    }
    
    func checkIsMe() -> Bool {
        if Auth.auth().currentUser?.email != nil {
            return true
        } else {
            return false
        }
    }
    
}
