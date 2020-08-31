//
//  LoginController.swift
//  MyLogin
//
//  Created by Alessio Massa on 05/06/2020.
//  Copyright © 2020 alessioMassa. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase

enum LoginControllerSection: Hashable {
    case main
}

struct LoginControllerModel: Hashable {
    
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func ==(lhs: LoginControllerModel, rhs: LoginControllerModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    private let identifier = UUID()
}

class LoginController: UIViewController {
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<LoginControllerSection, LoginControllerModel>!
    var signoutButton: UIBarButtonItem!
    var viewModel: LoginViewModel {
        return LoginViewModel.shared
    }
    let authUI = FUIAuth.defaultAuthUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.controller = self
        configureHierarchy()
        configureDataSource()
    }
    
    func configureNavBar() {
        self.setNavBar()
        if viewModel.isLogged {
            signoutButton = UIBarButtonItem(title: "Signout", style: .plain, target: self,
                                              action: #selector(self.signOutButtonPressed))
        } else {
           signoutButton = UIBarButtonItem()
        }
        self.navigationItem.rightBarButtonItem = signoutButton
    }
    
    @objc func signOutButtonPressed() {
        FirebaseManager.shared.logOut()
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        collectionView.bounces = false
        view.addSubview(collectionView)
    }
    
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let section: NSCollectionLayoutSection
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalHeight(1.0))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            section = NSCollectionLayoutSection(group: group)
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<LoginControllerSection, LoginControllerModel>(collectionView: collectionView){
            (collectionView: UICollectionView, indexPath: IndexPath, item: LoginControllerModel) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: self.configureLoginCell(), for: indexPath, item: item)
        }
        viewModel.applySnapshot()
    }
    
    func configureLoginCell() -> UICollectionView.CellRegistration<LoginCell, LoginControllerModel> {
        return UICollectionView.CellRegistration<LoginCell,LoginControllerModel> { (cell, indexPath, item) in
            cell.viewController = self
            cell.item = item
            cell.setItems()
        }
    }
}

extension FUIAuthBaseViewController {
    
    open override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self,
                                                                action: #selector(backToLogin))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.title = "Login"
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 3
        descriptionLabel.text = "Create a profile, set beaches as favorites or visited, and more."
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func backToLogin() {
        self.dismiss(animated: true, completion: nil)
    }
}
