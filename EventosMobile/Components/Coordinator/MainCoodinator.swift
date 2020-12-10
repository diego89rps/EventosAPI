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
    
    func goToDetails(with viewModel : ResumeViewModel, index : Int) {
        let vc = DetailsViewController(viewModel: viewModel, index: index)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToMap(with longitude : Double, latitude : Double) {
        let vc = MapViewController(latitude : latitude, longitude : longitude)
        vc.coordinator = self
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    func goToName() {
        let vc = NameViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToEmail(viewModel : SettingsViewModel) {
        let vc = EmailViewController(with: viewModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
    //MARK:

}
