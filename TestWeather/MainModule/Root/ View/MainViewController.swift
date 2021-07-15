//
//  MainViewController.swift
//  TestWeather
//
//  Created by Алла Даминова on 14.07.2021.
//

import UIKit

class MainViewController: UITableViewController {

    var presenter: RootTableViewControllerPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        presenter.view = self
        DispatchQueue.global().async {
            self.presenter.downloadCity()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfRows() 
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        guard let currentWeatherCity = presenter.currentWeatherCity(forIndexPath: indexPath) else { return cell }
        cell.weatherCity = currentWeatherCity
        return cell
    }
}

extension MainViewController: RootTableViewControllerViewProtocol {
    func reloadView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
