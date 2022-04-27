//
//  HomeViewController.swift
//  FreeFitness
//
//  Created by W.D. on 20/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Private UI properites

    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.setTableViewDelegates(adapter, adapter)
        return homeView
    }()
    
    // MARK: - Internal Properties
    
    var passedEmail: String = ""
    var exercise: Exercise?
    
    // MARK: - Private Properties
    
    private var adapter = HomeAdapter()
    private var viewModel: HomeViewModel
    
    private var isLogin = false
    private let udUser = ""
    private let udIsLogin = false
    
    // MARK: - Initializers
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController Lifecycle Methods

    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        getUserName()
        getExercises()
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
        homeView.onTapLogOutButtonObservable.observe { [unowned self] in
            self.logOutAlert(title: "ALERT!", message: "Do you sure that want exit of the aplication?")
        }
        adapter.didSelectItemAt.observe { [unowned self] exercise in
            self.goToExerciseDescription(exercise: exercise)
        }
    }
    
    private func validateEvents(event: HomeViewModelOutput) {
        switch event {
        case .didFetchUserData(let user):
            homeView.userLabelText = user
            isLogin = true
            UserDefaults.standard.set(isLogin, forKey: "udIsLogin")
            UserDefaults.standard.set(user, forKey: udUser)
            UserDefaults.standard.synchronize()
        case .errorMessage(let error):
            self.showAlert(title: "ERROR!", message: error)
        case .didFetchExercises:
            adapter.exercise = viewModel.exercise
            homeView.setTableViewDelegates(adapter, adapter)
            homeView.reloadTableViewData()
        }
    }
    
    private func getUserName() {
        if UserDefaults.standard.bool(forKey: "udIsLogin") == true {
            if let user = UserDefaults.standard.string(forKey: udUser) {
                homeView.userLabelText = user
                }
            } else {
            viewModel.fetchUserName(email: passedEmail)
        }
    }
    
    private func getExercises() {
        viewModel.getExercises()
    }
    
    private func logOut() {
        viewModel.logOut(viewController: self)
        goTologin()
        isLogin = false
        UserDefaults.standard.set(isLogin, forKey: "udIsLogin")
        UserDefaults.standard.synchronize()
    }
    
    private func goTologin() {
        LoginFactory.showLoginViewController(from: self)
    }
    
    private func goToExerciseDescription(exercise: Exercise) {
        let viewController = ExerciseDescriptionViewController(exercise: exercise)
        viewController.modalPresentationStyle = .popover
        viewController.exercise = exercise
        //viewController.muscleImage = muscleImage
        present(viewController, animated: true)
    }
    
    private func logOutAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in
    }))
    alertController.addAction(UIAlertAction(title: "Accept", style: .default, handler: {action in
        self.logOut()
    }))
    self.present(alertController, animated: true, completion: nil)
  }

}
