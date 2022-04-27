//
//  AppDelegate.swift
//  FreeFitness
//
//  Created by W.D. on 19/04/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initialSetup(application: application, didFinishLaunchingWithOptions: launchOptions)
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

}

private extension AppDelegate {
    
    func initialSetup(application: UIApplication,
                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        setInitialController()
    }
    
    func setInitialController() {
        guard #available(iOS 13, *) else {
            let isLogin = UserDefaults.standard.bool(forKey: "udIsLogin")
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            let navigationController = UINavigationController(rootViewController: isLogin ? HomeFactory.getHomeViewController() : LoginViewController())
            window?.rootViewController = navigationController
            
            return
        }
    }
}

