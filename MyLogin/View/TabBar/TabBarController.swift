//
//  TabBarController.swift
//  MyLogin
//
//  Created by Alessio Massa on 31/08/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//

import UIKit

class TabBarController : UITabBarController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //self.tabBar.barTintColor = .red
        self.tabBar.tintColor = .black
        let home = createNavController(titleName: "Home", imageName: "house.fill",
                                       rootViewController: HomeController())
        let profile = createNavController(titleName: "Profile", imageName: "person.fill",
                                          rootViewController: LoginController())
        viewControllers = [home, profile]
        
    }
    
    private func createNavController(titleName: String, imageName: String, rootViewController: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.tabBarItem.title = titleName
        
        return navController
    }
    
}
