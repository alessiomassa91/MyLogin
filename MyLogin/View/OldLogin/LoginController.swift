//
//  LoginController.swift
//  MyLogin
//
//  Created by Alessio Massa on 04/06/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FacebookLogin
import FBSDKLoginKit

class OldLoginController: UIViewController {
    
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var stackAllLogin: UIStackView!
    @IBOutlet weak var changeDescription: UILabel!
    @IBOutlet weak var switchButton: UIButton!
    
    @IBOutlet weak var googleView: GIDSignInButton!
    @IBOutlet weak var fbView: UIView!
    @IBOutlet weak var appleStack: UIStackView!
    
    let signInAppleManager = SignInAppleManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let signInGoogleButton = GIDSignInButton()
        googleView.style = .wide
        //stackAllLogin.addArrangedSubview(signInGoogleButton)
        ///GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        let fbLoginButton = FBLoginButton()
        fbLoginButton.center = view.center
        view.addSubview(fbLoginButton)
        fbLoginButton.delegate = self
        
        signInAppleManager.loginController = self
        signInAppleManager.setLoginViewDidLoad(stackView: appleStack)
//        stackAllLogin.addArrangedSubview(appleStack)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //signInAppleManager.setLoginViewDidAppear(view: self)
    }
    
}

//
// MARK: - Login with Google setUp
//
extension OldLoginController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { (result, error) in
                if error == nil {
                    let _ = result?.user.email
                    let _ = result?.user.displayName
                    //let _ = result?.user.
                    
                    Utilities().moveToHomeScreen()
                    
                } else {
                    print(error?.localizedDescription ?? "")
                }
            }
        }
    }
}




extension OldLoginController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let result = result, !result.isCancelled {
            print("Inside")
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            Auth.auth().signIn(with: credential) { (result, error) in
                if error == nil {
                    let _ = result?.user.email
                    let _ = result?.user.displayName
                    //let _ = result?.user.
                    
                    Utilities().moveToHomeScreen()
                    
                } else {
                    print(error?.localizedDescription ?? "")
                }
            }
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("LogOut")
    }
}

