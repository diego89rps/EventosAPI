//
//  MainCoodinator.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToResume()
        
    }
    
    func goToResume() {
        let vc = ResumeTabViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func popToRoot() {
//        let vc = ResponsibleResumeTabBarController()
//        vc.coordinator = self
//        navigationController.popToRootViewController(animated: true)
    }
    
    //MARK:

}
