//
//  SceneDelegate.swift
//  FreeFitness
//
//  Created by Jorge Luis Rivera Ladino - Ceiba Software on 19/04/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setInitialController(to: windowScene)
    }

}

@available(iOS 13.0, *)
private extension SceneDelegate {
    
    func setInitialController(to windowScene: UIWindowScene) {
        let isLogin = UserDefaults.standard.bool(forKey: "udIsLogin")
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: isLogin ? HomeFactory.getHomeViewController() : LoginViewController())
        window?.rootViewController = navigationController
        return
    }
}

