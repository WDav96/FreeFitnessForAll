//
//  HomeViewModel.swift
//  FreeFitness
//
//  Created by W.D. on 21/04/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

enum HomeViewModelOutput {
    case didFetchUserData(String)
    case didFetchExercises
    case errorMessage(String)
    
}

class HomeViewModel {
    
    // MARK: - Internal Propertiers
    
    var outputEvents: Observable<HomeViewModelOutput> {
        mutableOutputEvents
    }
    
    var exercise: [Exercise] = []
    
    // MARK: - Private Propertiers
    
    private var database = Firestore.firestore()
    
    private var firestore: Firestore {
        let firestore = Firestore.firestore()
        let settings = firestore.settings
        settings.isPersistenceEnabled = true
        firestore.settings = settings
        return firestore
    }
    
    private let mutableOutputEvents = MutableObservable<HomeViewModelOutput>()
    
    // MARK: - Internal Methods
    
    func fetchUserName(email: String) {
        database.collection("users").document(email).getDocument { (documentSnapshot, error) in
            if let document = documentSnapshot, error == nil {
                if let user = document.get("user") as? String {
                    self.mutableOutputEvents.postValue(.didFetchUserData(user))
                }
            } else {
                if let error = error {
                    self.mutableOutputEvents.postValue(.errorMessage(error.localizedDescription))
                }
            }
        }
    }
    
    func getExercises() {
        fetchExercises { [weak self] result in
            switch result {
            case .success(let exercises):
                self?.exercise = exercises
                self?.mutableOutputEvents.postValue(.didFetchExercises)
            case .failure(let error):
               self?.mutableOutputEvents.postValue(.errorMessage(error.localizedDescription))
            }
        }
    }
    
    func logOut(viewController: UIViewController) {
        do {
            try Auth.auth().signOut()
        } catch let error as NSError {
            self.mutableOutputEvents.postValue(.errorMessage(error.localizedDescription))
        }
    }
    
    // MARK: - Private Methods
    
    private func fetchExercises(completionHandler: @escaping (Result<[Exercise], Error>) -> Void) {
        firestore.collection("exercises").getDocuments { [weak self] (snapshot, error) in
            guard let self = self else {
                return
            }
            
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            snapshot?.documents.forEach {
                let json = $0.data()
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    
                    let exercise = try JSONDecoder().decode(Exercise.self, from: jsonData)
                    self.exercise.append(exercise)
                    completionHandler(.success(self.exercise))
                } catch {
                    completionHandler(.failure(error))
                }
            }
        }
    }
    
}
