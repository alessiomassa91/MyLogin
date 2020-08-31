//
//  HomeController.swift
//  MyLogin
//
//  Created by Alessio Massa on 04/06/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel!
    
    override func viewDidLoad() {
        configureNavBar()
        configureHierarchy()
    }
    
    func configureNavBar() {
        self.setNavBar()
    }
    
    func configureHierarchy() {
        view.backgroundColor = .white
        label = UILabel()
        label.text = "Hello world"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
