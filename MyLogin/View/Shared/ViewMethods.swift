//
//  ViewMethods.swift
//  MyLogin
//
//  Created by Alessio Massa on 31/08/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//

import UIKit

extension UIViewController {
    func setNavBar(){
        self.navigationItem.title = "Login APP"
        self.navigationController?.navigationBar.barTintColor = UIColor.init(named: "Toolbar")
        self.navigationController?.navigationBar.isTranslucent = true
    }
}
