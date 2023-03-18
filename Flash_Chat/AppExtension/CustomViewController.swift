//
//  CustomViewController.swift
//  Flash_Chat
//
//  Created by Sergey on 13.03.2023.
//

import UIKit

class CustomViewController<V: CustomView>: UIViewController {
    
    override func loadView() {
        view = V()
    }
    
    var customView: V {
        view as! V
    }
    
}
