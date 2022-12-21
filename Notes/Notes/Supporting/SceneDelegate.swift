//
//  SceneDelegate.swift
//  Notes
//
//  Created by Александр Косяков on 21.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let firstVC = MainViewController()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        let navController = UINavigationController (rootViewController: firstVC)
        window?.rootViewController = navController
//        window?.overrideUserInterfaceStyle = .dark
        
    }
}
