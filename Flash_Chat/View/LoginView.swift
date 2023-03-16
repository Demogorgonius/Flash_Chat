//
//  LoginView.swift
//  Flash_Chat
//
//  Created by Sergey on 15.03.2023.
//

import Foundation
import UIKit
import SnapKit

protocol LoginViewDelegate: AnyObject {
    
    func loginView(loginButtonTapped button: UIButton)
    func loginView(backButtonTapped button: UIButton)
    
}

class LoginView: CustomView {
    //MARK: - Variables
    
    weak var delegate: LoginViewDelegate?
    
    //MARK: - StackView/UIView
    
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "BrandBlue")
        return view
    }()
    
    lazy var emailView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 177))
        return view
    }()
    
    lazy var passwordView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 177))
        return view
    }()
    
    //MARK: - UIImageView
    
    lazy var emailBackgroundImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 414, height: 37))
        image.image = UIImage(named: "textfield")
        return image
    }()
    
    lazy var passwordBackgroundImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 414, height: 37))
        image.image = UIImage(named: "textfield")
        return image
    }()
    
    //MARK: - UIButtons
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 414, height: 51)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        button.setTitleColor(UIColor(named: "BrandLightBlue"), for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "arrow.left", withConfiguration: iconConfiguration)
        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - UITextView
    
    lazy var emailTextField: UITextField = {
        let text = UITextField(frame: CGRect(x: 0, y: 0, width: 318, height: 45))
        text.placeholder = "Email"
        text.borderStyle = .none
        text.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        text.textColor = UIColor(named: "BrandBlue")
        text.textAlignment = .center
        return text
    }()
    
    lazy var passwordTextField: UITextField = {
        let text = UITextField(frame: CGRect(x: 0, y: 0, width: 318, height: 45))
        text.placeholder = "Password"
        text.borderStyle = .none
        text.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        text.textColor = UIColor(named: "BrandBlue")
        text.textAlignment = .center
        text.isSecureTextEntry = true
        return text
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(backgroundView)
        backgroundView.addSubview(emailView)
        emailView.addSubview(emailBackgroundImage)
        emailView.addSubview(emailTextField)
        backgroundView.addSubview(passwordView)
        passwordView.addSubview(passwordBackgroundImage)
        passwordView.addSubview(passwordTextField)
        passwordView.addSubview(loginButton)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        setupConstraints()
        
    }
    
    
}

extension LoginView {
    
    
    func setupConstraints() {
        
        backgroundView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        emailView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(177)
        }
        
        emailBackgroundImage.snp.makeConstraints { make in
            make.leading.equalTo(emailView.snp.leading)
            make.trailing.equalTo(emailView.snp.trailing)
            make.centerY.equalTo(emailView)
            make.height.equalTo(137)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalTo(emailBackgroundImage)
            make.height.equalTo(45)
            make.width.equalTo(318)
            make.top.equalTo(emailBackgroundImage.snp.top).offset(25)
        }
        
        passwordView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(177)
            make.top.equalTo(emailView.snp.bottom).offset(-100)
        }
        
        passwordBackgroundImage.snp.makeConstraints { make in
            make.height.equalTo(137)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalTo(passwordView)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.width.equalTo(318)
            make.centerX.equalTo(passwordView)
            make.top.equalTo(passwordBackgroundImage.snp.top).offset(25)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(51)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(31)
        }
        
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        
    }
    
}
