//
//  LoginViewModel.swift
//  FreeFitness
//
//  Created by W.D. on 19/04/22.
//

import Foundation
import FirebaseAuth

enum LoginViewModelOutput {
    case didSignIn
    case errorMessage(String)
    
}

class LoginViewModel {
    
    // MARK: - Internal Propertiers
    
    var outputEvents: Observable<LoginViewModelOutput> {
        mutableOutputEvents
    }
    
    // MARK: - Private Propertiers
    
    private let mutableOutputEvents = MutableObservable<LoginViewModelOutput>()

    // MARK: - Internal Methods
    
    func signIn(email: String?, password: String?) {
        if let email = email, let password = password {
        Auth.auth().signIn(withEmail: email, password: password) { [self] result, error in
            
            if let _ = result, error == nil {
                self.mutableOutputEvents.postValue(.didSignIn)
            } else {
                if let error = error {
                    self.mutableOutputEvents.postValue(.errorMessage(error.localizedDescription))
                    return
                    }
                }
            }
        }
    }
    
}
