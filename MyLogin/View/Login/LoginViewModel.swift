//
//  LoginViewModel.swift
//  MyLogin
//
//  Created by Alessio Massa on 30/08/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//

import UIKit

class LoginViewModel {
    static var shared = LoginViewModel()
    var controller: LoginController?
    var snapshot = NSDiffableDataSourceSectionSnapshot<LoginControllerModel>()
    
    var isLogged: Bool {
        return FirebaseManager.user != nil
    }
    
    func applySnapshot(){
        guard let controller = controller, let dataSource = controller.dataSource else { return }
        controller.configureNavBar()
        snapshot.deleteAll()
        let itemSnapshot = [LoginControllerModel(user: FirebaseManager.user)]
        snapshot.append(itemSnapshot)
        dataSource.apply(snapshot, to: .main, animatingDifferences: false)
    }
}
