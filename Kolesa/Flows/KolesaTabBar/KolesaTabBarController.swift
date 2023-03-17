//
//  KolesaTabBarController.swift
//  Kolesa
//
//  Created by Ernar Khasen on 15.03.2023.
//


import UIKit

final class KolesaTabBarController: UITabBarController {
    
    private let homeVC = HomeViewController()
    
    private let favVC = FavouritesViewController()
    
    private let adVC = AdViewController()
    
    private let messagesVC = MessagesViewController()
    
    private let profileVC = ProfileViewController()
    
    private var isScrolling: Bool?{
        didSet {
            setupTabs()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTabs()
        setupLayer()
        homeVC.delegate = self
    }
    
    func setupTabs(){
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: favVC)
        let nav3 = UINavigationController(rootViewController: adVC)
        let nav4 = UINavigationController(rootViewController: messagesVC)
        let nav5 = UINavigationController(rootViewController: profileVC)
        
        homeVC.navigationItem.largeTitleDisplayMode = .automatic
        favVC.navigationItem.largeTitleDisplayMode = .automatic
        adVC.navigationItem.largeTitleDisplayMode = .automatic
        messagesVC.navigationItem.largeTitleDisplayMode = .automatic
        profileVC.navigationItem.largeTitleDisplayMode = .automatic
        
        nav1.tabBarItem = UITabBarItem(title: "Kolesa.kz", image: isScrolling ?? false ? UIImage(systemName: "arrow.up") : UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "heart"), tag: 2)
        //TODO: - Надо сделать так чтоб при нажатии на "Подать" применялся метод present
        nav3.tabBarItem = UITabBarItem(title: "Подать", image: UIImage(systemName: "plus.app.fill"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Сообщения", image: UIImage(systemName: "envelope"), tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "Кабинет", image: UIImage(systemName: "person.circle"), tag: 5)
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: false)
    }
    
    func setupLayer() {
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        tabBar.layer.shadowRadius = 3.0
    }
}

extension KolesaTabBarController: HomeViewControllerDelegate {
    func viewController(_ viewController: UIViewController, isScrolling: Bool) {
        self.isScrolling = isScrolling
    }
}
