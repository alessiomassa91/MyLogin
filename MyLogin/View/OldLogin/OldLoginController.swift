//
//  LoginController.swift
//  MyLogin
//
//  Created by Alessio Massa on 04/06/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//
/*
import UIKit
import GoogleSignIn
import Firebase
import FacebookLogin
import FBSDKLoginKit

class OldLoginController: UIViewController {
    
    @IBOutlet weak var descriptionText: UILabel!
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
            print("Google: accessToken \(authentication.accessToken)")
            print("Google: idToken \(authentication.idToken)")
            print("Google: clientID \(authentication.clientID)")
            FirebaseManager.shared.signIn(credential: credential)
        }
    }
}




extension OldLoginController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let result = result, !result.isCancelled {
            print("Inside")
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            print("FB: accessToken \(AccessToken.current?.tokenString)")
            print("FB: userID \(AccessToken.current?.userID)")
            print("FB: permissions \(AccessToken.current?.permissions)")
            FirebaseManager.shared.signIn(credential: credential)
        }
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("LogOut")
    }
}

*/
