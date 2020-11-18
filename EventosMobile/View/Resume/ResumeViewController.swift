//
//  ResumeViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit

class ResumeViewController:  AppDefaultViewController {
    typealias CustomView = ResumeView
    typealias ViewModel = ResumeViewModel
    var detailsCallback: (String, String) -> Void = { _,_ in }
    
    let customView = CustomView()
    let viewModel = ViewModel()
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupCellsData()
        setupTableView()
    }
    
    private func showDetails(with title: String, image: String) {
            detailsCallback(title, image)
        }
    
}

extension ResumeViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResumeViewCell.description(), for: indexPath) as? ResumeViewCell else { return UITableViewCell() }
            
        cell.leftTitle.text = viewModel.getTitle(indexPath: indexPath.row)
        cell.date.text = viewModel.getDateFormat(indexPath: indexPath.row)
        cell.cost.text = viewModel.getCost(indexPath: indexPath.row)


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetails(with: viewModel.data[indexPath.row].title, image: viewModel.data[indexPath.row].title)
    }
    
}

