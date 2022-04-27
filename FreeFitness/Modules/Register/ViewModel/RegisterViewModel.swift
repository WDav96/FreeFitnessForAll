//
//  RegisterViewModel.swift
//  FreeFitness
//
//  Created by W.D. on 20/04/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum RegisterViewModelOutput {
    case didRegister
    case dontConfirmPassword
    case emptyTextField
    case errorMessage(String)
}

class RegisterViewModel {
    // MARK: - Internal Propertiers
    
    var outputEvents: Observable<RegisterViewModelOutput> {
        mutableOutputEvents
    }
    
    // MARK: - Private Propertiers
    
    private let dataBase = Firestore.firestore()
    
    private let mutableOutputEvents = MutableObservable<RegisterViewModelOutput>()

    // MARK: - Internal Methods
    
    func createUser(user: String?, email: String?, phone: String?, password: String?, confirmPassword: String?) {
        if let user = user, let email = email, let phone = phone, let password = password, let confirmPassword = confirmPassword {
            if user .isEmpty || email .isEmpty || phone .isEmpty || password .isEmpty || confirmPassword .isEmpty {
                self.mutableOutputEvents.postValue(.emptyTextField)
            } else if password == confirmPassword {
                Auth.auth().createUser(withEmail: email, password: confirmPassword) { [self] result, error in
                    
                    if let _ = result, error == nil {
                        self.mutableOutputEvents.postValue(.didRegister)
                        saveUserData(email: email, user: user, phone: phone)
                    } else {
                        if let error = error {
                            self.mutableOutputEvents.postValue(.errorMessage(error.localizedDescription))
                            return
                        }
                    }
                }
            } else {
                self.mutableOutputEvents.postValue(.dontConfirmPassword)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func saveUserData(email: String, user: String, phone: String) {
        dataBase.collection("users").document(email).setData(["user" : user, "email" : email, "phone" : phone])
    }
    
}
