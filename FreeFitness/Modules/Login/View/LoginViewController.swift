//
//  ViewController.swift
//  FreeFitness
//
//  Created by W.D. on 19/04/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Internal UI properites
    
    private var loginView = LoginView()
    
    // MARK: - Private Properties
    
    private var viewModel = LoginViewModel()
    
    // MARK: - Lifecycle ViewController Methods
    
    override func loadView() {
        super.loadView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - Private Methods
    
    private func setupBindings() {
        viewModel.outputEvents.observe { [weak self] event in
            self?.validateEvents(event: event)
        }
        loginView.onTapLoginButtonObservable.observe { [unowned self] in
            self.emailAuthentication()
        }
        
        loginView.onTapRegisterButtonObservable.observe { [unowned self] in
            self.goToRegister()
        }
    }
    
    private func validateEvents(event: LoginViewModelOutput) {
        switch event {
        case .didSignIn:
            UserDefaults.standard.set(true, forKey: "isAuthenticated")
            goToHome()
        case .errorMessage(let error):
            self.showAlert(title: "ERROR!", message: "\(error)")
        }
    }
    
    private func emailAuthentication() {
        viewModel.signIn(email: loginView.emailTexFieldText, password: loginView.passwordTexFieldText)
    }
    
    private func goToRegister() {
        RegisterFactory.showRegisterViewController(from: self)
    }
    
    private func goToHome() {
        let email: String = loginView.emailTexFieldText ?? ""
        HomeFactory.showHomeViewController(from: self, email: email)
    }
    
}

