//
//  WelcomeView.swift
//  Flash_Chat
//
//  Created by Sergey on 13.03.2023.
//

import Foundation
import UIKit
import SnapKit

protocol WelcomeViewDelegate: AnyObject {
    func welcomeView(loginTapped button: UIButton)
    func welcomeView(registerTapped button: UIButton)
}

class WelcomeView: CustomView {
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 310, height: 60))
        label.text = "⚡️FlashChat"
        label.font = UIFont.systemFont(ofSize: 50, weight: .black)
        label.numberOfLines = 1
        label.textColor = UIColor(named: "BrandBlue")
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 414, height: 61)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        button.setTitleColor(UIColor(named: "BrandBlue"), for: .normal)
        button.backgroundColor = UIColor(named: "BrandLightBlue")
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 414, height: 61)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemTeal
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(titleLabel)
        addSubview(registerButton)
        addSubview(loginButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        setupConstraints()
    }
    
    func setupConstraints() {
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(61)
            make.top.equalTo(registerButton.snp.bottom).offset(8)
        }
        
        registerButton.snp.makeConstraints { make in
            make.height.equalTo(61)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
    
    @objc func registerButtonTapped(_ sender: UIButton) {
        
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        
    }
    
}
