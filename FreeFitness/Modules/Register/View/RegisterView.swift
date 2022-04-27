//
//  RegisterView.swift
//  FreeFitness
//
//  Created by W.D. on 20/04/22.
//

import UIKit

class RegisterView: UIView {
     // MARK: - Private UI Properties
    
    private var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Create Account"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var subtitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Create a new account"
        label.textColor = .greenMainColor
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 500))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var userTextField: UITextField = {
       let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "USER"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.setLeftIcon(UIImage(named: "userIcon")!, .greenMainColor)
        return textfield
    }()
    
    private var emailTextField: UITextField = {
       let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "EMAIL"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.setLeftIcon(UIImage(named: "mailIcon")!, .greenMainColor)
        return textfield
    }()
    
    private var phoneTextField: UITextField = {
       let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "PHONE"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.setLeftIcon(UIImage(named: "phoneIcon")!, .greenMainColor)
        return textfield
    }()
    
    private var passwordTextField: UITextField = {
       let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "PASSWORD"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.setLeftIcon(UIImage(named: "lockIcon")!, .greenMainColor)
        return textfield
    }()
    
    private var confirmPasswordTextField: UITextField = {
       let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "CONFIRM PASSWORD"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.setLeftIcon(UIImage(named: "lockIcon")!, .greenMainColor)
        return textfield
    }()
    
    private var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("CREATE ACCOUNT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.greenMainColor
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(onTapCreateAccountButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var haveAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Have a account", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.greenMainColor, for: .normal)
        button.addTarget(self, action: #selector(onTapHaveAccountButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Internal Properties
    
    var onTapCreateAccountButtonObservable: Observable<Void> {
        onTapCreateAccountButton
    }
    
    var onTapHaveAccountButtonObservable: Observable<Void> {
        onTapHaveAccountButton
    }
    
    var userTextFieldText: String? {
        get { userTextField.text}
        set { userTextField.text = newValue }
    }
    
    var emailTextFieldText: String? {
        get { emailTextField.text}
        set { emailTextField.text = newValue }
    }
    
    var phoneTextFieldText: String? {
        get { phoneTextField.text}
        set { phoneTextField.text = newValue }
    }
    
    var passwordTextFieldText: String? {
        get { passwordTextField.text}
        set { passwordTextField.text = newValue }
    }
    
    var confirmPasswordTextFieldText: String? {
        get { confirmPasswordTextField.text}
        set { confirmPasswordTextField.text = newValue }
    }
    
    // MARK: - Private Properties
    
    private var onTapCreateAccountButton = MutableObservable<Void>()
    private var onTapHaveAccountButton = MutableObservable<Void>()
    
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
    private func onTapCreateAccountButtonAction(sender: UIButton!) {
        onTapCreateAccountButton.postValue(())
    }
    
    @objc
    private func onTapHaveAccountButtonAction(sender: UIButton!) {
        onTapHaveAccountButton.postValue(())
    }
    
    private func addSubViews() {
        addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(subtitleLabel)
        
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(userTextField)
        containerStackView.addArrangedSubview(emailTextField)
        containerStackView.addArrangedSubview(phoneTextField)
        containerStackView.addArrangedSubview(passwordTextField)
        containerStackView.addArrangedSubview(confirmPasswordTextField)
        containerStackView.addArrangedSubview(createAccountButton)
        containerStackView.addArrangedSubview(haveAccountButton)
        
        addConstraints()
    }
    
    private func addConstraints() {
        // labelsStackView
        labelsStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelsStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        labelsStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        // titleLabel
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        
        // containerStackView
        containerStackView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 40).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        // userTextField
        userTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // emailTextField
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // phoneTextField
        phoneTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // passwordTextField
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // confirmPasswordTextField
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // createAccountButton
        createAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // haveAccountButton
        haveAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
