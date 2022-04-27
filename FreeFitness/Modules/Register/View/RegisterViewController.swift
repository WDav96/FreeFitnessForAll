//
//  RegisterViewController.swift
//  FreeFitness
//
//  Created by W.D. on 20/04/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Private UI Properties
    
    private var registerView = RegisterView()
    
    // MARK: - Private Properties
    
    private var viewModel = RegisterViewModel()
    
    // MARK: - Lifecycle ViewController Methods
    
    override func loadView() {
        super.loadView()
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: - Private Methods
    
    private func registerEmail() {
        viewModel.createUser(user: registerView.userTextFieldText,
                           email: registerView.emailTextFieldText,
                           phone: registerView.phoneTextFieldText,
                           password: registerView.passwordTextFieldText,
                           confirmPassword: registerView.confirmPasswordTextFieldText)
    }
    
    private func setupBindings() {
        viewModel.outputEvents.observe { [weak self] event in
            self?.validateEvents(event: event)
        }
        registerView.onTapCreateAccountButtonObservable.observe { [unowned self] in
            self.registerEmail()
        }
        
        registerView.onTapHaveAccountButtonObservable.observe { [unowned self] in
            self.goToLogin()
        }
    }
    
    private func validateEvents(event: RegisterViewModelOutput) {
        switch event {
        case .didRegister:
            self.showAlert(title: "SUCCESS!", message: "The register has been success, now login with your credentials")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.goToLogin()
            }
        case .dontConfirmPassword:
            self.showAlert(title: "ERROR!", message: "Passwords do not match, verify this and continue")
        case .emptyTextField:
            self.showAlert(title: "ERROR!", message: "There is an empty text field, please check and try again")
        case .errorMessage(let error):
            self.showAlert(title: "ERROR!", message: "\(error)")
        }
    }
    
    private func goToLogin() {
        LoginFactory.showLoginViewController(from: self)
    }
    
}
