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

        presenter.view = self

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

}

extension MainViewController: RootTableViewControllerViewProtocol {
    
}
