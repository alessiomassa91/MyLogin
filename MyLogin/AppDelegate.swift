//
//  AppDelegate.swift
//  MyLogin
//
//  Created by Alessio Massa on 04/06/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        FirebaseManager.shared.handleLogin()
        
        /*
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                print("displayName \(auth.currentUser?.displayName)")
                print("email \(auth.currentUser?.email)")
                print("isAnonymous \(auth.currentUser?.isAnonymous)")
                print("isEmailVerified \(auth.currentUser?.isEmailVerified)")
                print("userAccessGroup \(auth.userAccessGroup)")
                print("photoURL \(auth.currentUser?.photoURL)")
                print("phoneNumber \(auth.currentUser?.phoneNumber)")
                print("uid \(auth.currentUser?.uid)")
            }
        }*/
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

