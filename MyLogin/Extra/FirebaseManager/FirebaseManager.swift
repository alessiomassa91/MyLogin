//
//  FirebaseManager.swift
//  MyLogin
//
//  Created by Alessio Massa on 29/08/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit

class FirebaseManager {
    
    static let shared = FirebaseManager()
    static var user = Auth.auth().currentUser 
    let loginViewModel = LoginViewModel.shared
    
    
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            LoginManager().logOut()
            FirebaseManager.user = nil
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func handleLogin() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if auth.currentUser?.uid != nil {
                FirebaseManager.user = user
            }
            self.loginViewModel.applySnapshot()
        }
    }
}

