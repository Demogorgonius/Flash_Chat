//
//  ChatTableView.swift
//  Flash_Chat
//
//  Created by Sergey on 16.03.2023.
//

import Foundation
import UIKit

class ChatTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        backgroundColor = UIColor.white
        register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.reuseID)
        rowHeight = 40
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

