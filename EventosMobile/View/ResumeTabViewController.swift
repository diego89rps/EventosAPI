//
//  ResumeTabViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit
import RxSwift

class ResumeTabViewController: UITabBarController, UITabBarControllerDelegate {
    
    var coordinator: MainCoordinator?
    //let disposeBag = DisposeBag()
    let mainTab = UIViewController()
    let settingsTab = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabBar()
        bindInputs()
        setupTabBarLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
        addTabs()
    }
    
    private func setupTabBarLayout() {
        UITabBar.appearance().tintColor = .black
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont.averta(.extra_bold, withSize: 10)]
        appearance.setTitleTextAttributes(attributes, for: .normal)
    }
    
    private func bindInputs() {

    }
    
    private func addTabs() {
        self.viewControllers = [mainTab, settingsTab]
    }
    
    private func setupTabBar() {
        setupTabOne()
        setupTabTwo()
    }
    
    private func setupNavigationController() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: Children tab(1)
    private func setupTabOne() {
        let item = UITabBarItem(title: "main",
                                image: UIImage(named: "filhosTabItem"),
                                selectedImage: UIImage(named: "filhosSelectedItem"))
        mainTab.tabBarItem = item
    }
    
    // MARK: Notifications tab(2)
    private func setupTabTwo() {
        let item = UITabBarItem(title: "Notificações", image: UIImage(named: "notificationsTabItem"), selectedImage: UIImage(named: "notificationsSelected"))
        settingsTab.tabBarItem = item
    }
    
}
