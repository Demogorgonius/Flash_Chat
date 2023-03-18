//
//  ChatTableViewCell.swift
//  Flash_Chat
//
//  Created by Sergey on 16.03.2023.
//

import Foundation
import UIKit
import SnapKit

class ChatTableViewCell: UITableViewCell {
    
    static let reuseID = "ChatCell"
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "message"
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
        contentView.addSubview(messageLabel)
    }
    
    func layoutViews() {
        messageLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(40)
        }
    }
}
