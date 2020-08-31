//
//  LoggedCell.swift
//  MyLogin
//
//  Created by Alessio Massa on 29/08/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//

//

import UIKit
import FirebaseUI
import FBSDKLoginKit
import AlamofireImage

class LoginCell: UICollectionViewCell {
    
    let imgProfile = UIImageView()
    let nameProfile = UILabel()
    let buttonLogin = UIButton()
    var viewController: LoginController?
    var item: LoginControllerModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension LoginCell {
    
    func setItems() {
        
        if (item?.user != nil)  {
            configureLoggedState()
        } else {
            configureNoLoggedState()
        }
    }
    
    func configureLoggedState() {
        
        let defaultImage = UIImage(systemName: "person.fill")
        
        if let url = item?.user?.photoURL {
            imgProfile.af.setImage(withURL: url)
        } else {
            imgProfile.image = defaultImage
        }
        
        imgProfile.tintColor = .black
        imgProfile.clipsToBounds = true
        imgProfile.contentMode = .scaleAspectFit
        imgProfile.translatesAutoresizingMaskIntoConstraints = false
        
        nameProfile.text = item?.user?.displayName
        nameProfile.textAlignment = .center
        nameProfile.font = UIFont.systemFont(ofSize: 20)
        nameProfile.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imgProfile)
        contentView.addSubview(nameProfile)
        
        NSLayoutConstraint.activate([
            
            imgProfile.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imgProfile.bottomAnchor.constraint(equalTo: nameProfile.topAnchor, constant: -20),
            imgProfile.widthAnchor.constraint(equalToConstant: 100),
            imgProfile.heightAnchor.constraint(equalToConstant: 100),
            
            nameProfile.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameProfile.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameProfile.heightAnchor.constraint(equalToConstant: 40),
            nameProfile.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
        ])
    }
    
    func configureNoLoggedState() {
        imgProfile.image = UIImage(systemName: "person.fill")
        imgProfile.tintColor = .black
        imgProfile.clipsToBounds = true
        imgProfile.contentMode = .scaleAspectFit
        imgProfile.translatesAutoresizingMaskIntoConstraints = false
        
        nameProfile.text = "Sign up for an account"
        nameProfile.textAlignment = .center
        nameProfile.font = UIFont.systemFont(ofSize: 20)
        nameProfile.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLogin.backgroundColor = .red
        buttonLogin.setTitle("Sign up", for: .normal)
        buttonLogin.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imgProfile)
        contentView.addSubview(nameProfile)
        contentView.addSubview(buttonLogin)
        
        NSLayoutConstraint.activate([
        
            imgProfile.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imgProfile.bottomAnchor.constraint(equalTo: nameProfile.topAnchor, constant: -20),
            imgProfile.widthAnchor.constraint(equalToConstant: 100),
            imgProfile.heightAnchor.constraint(equalToConstant: 100),
            
            nameProfile.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameProfile.bottomAnchor.constraint(equalTo: buttonLogin.topAnchor, constant: -20),
            nameProfile.heightAnchor.constraint(equalToConstant: 40),
            nameProfile.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            buttonLogin.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonLogin.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonLogin.widthAnchor.constraint(equalToConstant: 150),
            buttonLogin.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    @objc func signUpAction(_ sender: UIButton) {
        goToAuthViewController()
        //Utilities().moveToLoginScreen()
    }
    
    private func goToAuthViewController() {
        let authUI = FUIAuth.defaultAuthUI()
        let providers: [FUIAuthProvider] = [
            FUIOAuth.appleAuthProvider(),
            FUIGoogleAuth(),
            FUIFacebookAuth()
        ]
        authUI?.providers = providers
        let authViewController = authUI!.authViewController()
        viewController?.present(authViewController, animated: true, completion: nil)
    }
}
