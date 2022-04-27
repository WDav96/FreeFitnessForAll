//
//  LoginView.swift
//  FreeFitness
//
//  Created by W.D. on 19/04/22.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Private UI Properties
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Fx3A"
        label.textColor = .greenMainColor
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var emailTextField: UITextField = {
       let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Email"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.setLeftIcon(UIImage(named: "mailIcon")!, .greenMainColor)
        return textfield
    }()
    
    private var passwordTextField: UITextField = {
       let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Password"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.setLeftIcon(UIImage(named: "lockIcon")!, .greenMainColor)
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.greenMainColor
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create a new count", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.greenMainColor, for: .normal)
        button.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Internal Properties
    
    var onTapLoginButtonObservable: Observable<Void> {
        onTapLoginButton
    }
    
    var onTapRegisterButtonObservable: Observable<Void> {
        onTapRegisterButton
    }
    
    var emailTexFieldText: String? {
        get { emailTextField.text}
        set { emailTextField.text = newValue }
    }
    
    var passwordTexFieldText: String? {
        get { passwordTextField.text}
        set { passwordTextField.text = newValue }
    }
    
    // MARK: - Private Properties
    
    private var onTapLoginButton = MutableObservable<Void>()
    private var onTapRegisterButton = MutableObservable<Void>()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    @objc
    private func loginButtonAction(sender: UIButton!) {
        onTapLoginButton.postValue(())
    }
    
    @objc
    private func registerButtonAction(sender: UIButton!) {
        onTapRegisterButton.postValue(())
    }
    
    private func addSubViews() {
        addSubview(titleLabel)
        addSubview(containerStackView)
        addSubview(buttonsStackView)
        containerStackView.addArrangedSubview(emailTextField)
        containerStackView.addArrangedSubview(passwordTextField)
        buttonsStackView.addArrangedSubview(loginButton)
        buttonsStackView.addArrangedSubview(registerButton)
        
        addConstraints()
    }
    
    private func addConstraints() {
        // titleLabel
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        
        // containerStackView
        containerStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        // userTextField
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // passwordTextField
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // buttonsStackView
        buttonsStackView.topAnchor.constraint(equalTo: containerStackView.bottomAnchor).isActive = true
        buttonsStackView.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        buttonsStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        // loginButton
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.topAnchor.constraint(equalTo: containerStackView.bottomAnchor, constant: 15).isActive = true
        
        // registerButton
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
