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
    
    let defaults = UserDefaults.standard
    
    lazy var messageView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        view.backgroundColor = UIColor(named: "BrandLightBlue")
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var userView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var avatarImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        image.image = UIImage(systemName: "person.crop.square")
        return image
    }()
    
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 14))
        label.text = "user"
        label.font = UIFont.systemFont(ofSize: 10, weight: .thin)
        label.textColor = .black
        label.textAlignment = .center
        return label
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
        messageView.addSubview(userView)
        userView.addSubview(avatarImage)
        userView.addSubview(userNameLabel)
        self.isUserInteractionEnabled = false
    }
    
    func layoutViews() {
        
//        setupConstraints()
        
    }
    
    func setupConstraintsMe() {
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(messageView.snp.height).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        messageView.snp.makeConstraints { make in
            make.height.equalTo(messageLabel.snp.height).offset(40)
            make.width.equalTo(300)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(5)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(messageView.snp.top).offset(5)
            make.leading.equalTo(messageView.snp.leading).offset(15)
            make.trailing.equalTo(messageView.snp.trailing).offset(-50)
            make.bottom.equalTo(messageView.snp.bottom).offset(-5)
        }
        
        userView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.top.equalTo(messageView.snp.top)
            make.trailing.equalTo(messageView.snp.trailing)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(50)
            make.bottom.equalTo(userView.snp.bottom)
            make.centerX.equalTo(userView.snp.centerX)
        }
        
        avatarImage.snp.makeConstraints { make in
            make.top.equalTo(userView.snp.top).offset(5)
            make.centerX.equalTo(userView.snp.centerX)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
    }
    
    func setupConstraintsYou() {
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(messageView.snp.height).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        messageView.snp.makeConstraints { make in
            make.height.equalTo(messageLabel.snp.height).offset(40)
            make.width.equalTo(300)
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(5)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(messageView.snp.top).offset(5)
            make.leading.equalTo(messageView.snp.leading).offset(50)
            make.trailing.equalTo(messageView.snp.trailing).offset(-15)
            make.bottom.equalTo(messageView.snp.bottom).offset(-5)
        }
        
        userView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.top.equalTo(messageView.snp.top)
            make.leading.equalTo(messageView.snp.leading)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(50)
            make.bottom.equalTo(userView.snp.bottom)
            make.centerX.equalTo(userView.snp.centerX)
        }
        
        avatarImage.snp.makeConstraints { make in
            make.top.equalTo(userView.snp.top).offset(5)
            make.centerX.equalTo(userView.snp.centerX)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
    }
    
    func configureCell(message: String, user: String, isMe: Bool) {
        
        avatarImage.snp.removeConstraints()
        userNameLabel.snp.removeConstraints()
        userView.snp.removeConstraints()
        messageLabel.snp.removeConstraints()
        messageView.snp.removeConstraints()
        contentView.snp.removeConstraints()
        
        messageView.backgroundColor = UIColor(named: "BrandLightBlue")
        avatarImage.image = UIImage(named: "MeAvatar")
        
        if isMe == true {
            avatarImage.image = UIImage(named: "MeAvatar")
            setupConstraintsMe()
        } else {
            messageView.backgroundColor = UIColor(named: "BrandLightPurple")
            avatarImage.image = UIImage(named: "YouAvatar")
            setupConstraintsYou()
        }
        
        messageLabel.text = message
        userNameLabel.text = user.before(first: "@")
        
    }
    
    
    override func prepareForReuse() {
        
        avatarImage.snp.removeConstraints()
        userNameLabel.snp.removeConstraints()
        userView.snp.removeConstraints()
        messageLabel.snp.removeConstraints()
        messageView.snp.removeConstraints()
        contentView.snp.removeConstraints()
        
        
        messageView.backgroundColor = UIColor(named: "BrandLightBlue")
        avatarImage.image = UIImage(named: "MeAvatar")
        
    }
    
}
extension String {
    func before(first delimiter: Character) -> String {
        if let index = firstIndex(of: delimiter) {
            let before = prefix(upTo: index)
            return String(before)
        }
        return ""
    }
}

