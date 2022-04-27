//
//  LoginFactory.swift
//  FreeFitness
//
//  Created by W.D. on 20/04/22.
//

import UIKit

enum LoginFactory {
    
    static func getLoginViewController() -> LoginViewController {
        // viewController
        let viewController = LoginViewController()
        return viewController
    }
    
    static func showLoginViewController(from originViewController: UIViewController) {
        let viewController = getLoginViewController()
        originViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
