//
//  DetailsViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class DetailsViewController: AppDefaultViewController {
    typealias CustomView = DetailsView
    
    var coordinator: MainCoordinator?
    let customView = CustomView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        view = customView
        self.title = "nome do evento"
        bind()
        customView.image.image = #imageLiteral(resourceName: "settingsSelected")
        customView.textView.text = "O Patas Dadas estará na Redenção, nesse domingo, com cães para adoção e produtos à venda!\n\nNa ocasião, teremos bottons, bloquinhos e camisetas!\n\nTraga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarão prontinhos para ganhar o ♥ de um humano bem legal pra chamar de seu. \n\nAceitaremos todos os tipos de doação:\n- guias e coleiras em bom estado\n- ração (as que mais precisamos no momento são sênior e filhote)\n- roupinhas \n- cobertas \n- remédios dentro do prazo de validade"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func bind() {
        customView
            .mapBtn
            .rx
            .tap
            .bind { [weak self] (_) in
                   self?.goToMap()
            }.disposed(by: disposeBag)
    }
    
    private func goToMap() {
        self.coordinator?.goToMap()
    }
}
