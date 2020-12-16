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
    let viewModel : ResumeViewModel
    let index : Int
    
    init(viewModel: ResumeViewModel, index: Int) {
        self.viewModel = viewModel
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = customView
        setupDetails()
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupDetails() {
        self.title = viewModel.getTitle(indexPath: index)
        customView.dateAndCost.text = "\(viewModel.getDateFormat(indexPath: index)) - \(viewModel.getCost(indexPath: index))"
        customView.textView.text = viewModel.getDescription(indexPath: index)
        
        viewModel.getImage(indexPath: index) { (results) in
            switch results {
            case .success(let data):
                self.customView.image.image = UIImage(data: data)
            case .failure(_):
                self.customView.image.image = #imageLiteral(resourceName: "alert")
                self.customView.image.contentMode = .scaleAspectFit
            }
        }
    }
    
    private func bind() {
        customView
            .checkInBtn
            .rx
            .tap
            .bind { [weak self] (_) in
                   self?.makeCheckIn()
            }.disposed(by: disposeBag)

        customView
            .shareBtn
            .rx
            .tap
            .bind { [weak self] (_) in
                   self?.shareEvent()
            }.disposed(by: disposeBag)
        
        customView
            .mapBtn
            .rx
            .tap
            .bind { [weak self] (_) in
                   self?.goToMap()
            }.disposed(by: disposeBag)
    }
    
    //MARK: ACTIONS FROM BUTTONS
    private func makeCheckIn(){
        if let _ = UserDefaults.standard.string(forKey: "userName"),
           let _ = UserDefaults.standard.string(forKey: "userEmail"){
            checkInAlert(isRegister: true)
        }else{
            checkInAlert(isRegister: false)
        }
    }
    
    private func shareEvent() {
        let text = viewModel.createShareContents(indexPath : index)
        
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view

        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func goToMap() {
        let longitude = viewModel.getLongitude(indexPath: index)
        let latitude = viewModel.getLatitude(indexPath: index)

        self.coordinator?.goToMap(with : longitude, latitude : latitude)
    }
    
    func checkInAlert(isRegister: Bool){
        let texts = viewModel.getAlertText(value: isRegister)
        let alertController = UIAlertController(title: texts[0], message: texts[1], preferredStyle: .alert)

        let OKAction = UIAlertAction(title: texts[2], style: .default) { (action) in }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
            
        }
    }
}
