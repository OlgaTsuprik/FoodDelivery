//
//  AppDelegate.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 3.04.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        configureTabBar()

        return true
    }

    private func configureTabBar() {
        let mainMenuVС = MainMenuConfigurator().createMainMenuModule()
        mainMenuVС.tabBarItem.title = "Меню"
        mainMenuVС.tabBarItem.image = UIImage(named: "menuIcon")
        mainMenuVС.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        let tabBarController = UITabBarController()

        let contactsVC = ContactsViewController()

        contactsVC.tabBarItem.title = "Контакты"
        contactsVC.tabBarItem.image = UIImage(named: "contactsIcon")
        contactsVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

        let profileVC = ProfileViewController()
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(named: "profileIcon")
        profileVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

        let basketVC = BasketViewController()
        basketVC.tabBarItem.title = "Корзина"
        basketVC.tabBarItem.image = UIImage(named: "basketIcon")
        basketVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

        tabBarController.tabBar.tintColor = UIColor.systemPink

        tabBarController.viewControllers = [mainMenuVС, contactsVC, profileVC, basketVC]

        tabBarController.tabBar.backgroundColor = .white
        window?.rootViewController = tabBarController
    }
}

