//
//  HomeFactory.swift
//  FreeFitness
//
//  Created by W.D. on 20/04/22.
//

import UIKit

enum HomeFactory {
    static func getHomeViewController() -> HomeViewController {
        // viewModel
        let viewModel = HomeViewModel()
        // viewController
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
    
    static func showHomeViewController(from originViewController: UIViewController, email: String) {
        let viewController = getHomeViewController()
        viewController.passedEmail = email
        originViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
