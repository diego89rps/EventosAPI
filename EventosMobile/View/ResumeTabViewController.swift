//
//  ResumeTabViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class ResumeTabViewController: UITabBarController, UITabBarControllerDelegate {
    
    var coordinator: MainCoordinator?
    let disposeBag = DisposeBag()
    let mainTab = ResumeViewController()
    let settingsTab = SettingsViewController()
    
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
        UITabBar.appearance().tintColor = .defaultColor(ColorName.defaultDarkBlue)
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont.averta(.semibold, withSize: 10)]
        appearance.setTitleTextAttributes(attributes, for: .normal)
    }
    
    private func bindInputs() {
        mainTab.detailsCallback = {
            self.showDetails(with: $0, image: $1)
        }
        settingsTab
            .customView
            .button
            .rx
            .tap
            .bind { [weak self] (_) in
                self?.showResgisterName()
            }.disposed(by: disposeBag)
    }
    
    private func showDetails(with title: String, image: String) {
        self.coordinator?.goToDetails(with: title, image: image)
    }
    
    private func showResgisterName() {
        if let _ = UserDefaults.standard.string(forKey: "userName"),
           let _ = UserDefaults.standard.string(forKey: "userEmail") {
            UserDefaults.standard.set(nil, forKey: "userName")
            UserDefaults.standard.set(nil, forKey: "userEmail")
            settingsTab.viewDidAppear(true)
        } else {
            self.coordinator?.goToName()
        }
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
        let item = UITabBarItem(title: "eventos",
                                image: UIImage(named: "resumeTabItem"),
                                selectedImage: UIImage(named: "resumeSelected"))
        mainTab.tabBarItem = item
    }
    
    // MARK: Notifications tab(2)
    private func setupTabTwo() {
        let item = UITabBarItem(title: "configurações", image: UIImage(named: "settingsTabItem"), selectedImage: UIImage(named: "settingsSelected"))
        settingsTab.tabBarItem = item
    }
    
}
