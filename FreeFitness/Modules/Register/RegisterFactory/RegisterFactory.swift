//
//  RegisterFactory.swift
//  FreeFitness
//
//  Created by W.D. on 20/04/22.
//

import UIKit

enum RegisterFactory {
    
    static func getRegisterViewController() -> RegisterViewController {
        // viewController
        let viewController = RegisterViewController()
        return viewController
    }
    
    static func showRegisterViewController(from originViewController: UIViewController) {
        let viewController = getRegisterViewController()
        originViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
