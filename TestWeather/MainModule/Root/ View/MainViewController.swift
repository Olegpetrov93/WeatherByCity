//
//  MainViewController.swift
//  TestWeather
//
//  Created by Алла Даминова on 14.07.2021.
//

import UIKit

class MainViewController: UITableViewController {
    
    var presenter: RootTableViewControllerPresenterProtocol!
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItemsSetUp()
        addSearchBar()
        
        view.backgroundColor = .white
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    // MARK: - Navigation items set up
    private func navigationItemsSetUp() {
        
        let importExportItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        backBarButton.tintColor = .white
        navigationItem.backBarButtonItem = backBarButton
        
        importExportItem.tintColor = .white
        self.navigationItem.rightBarButtonItem = importExportItem
    }
    // MARK: - Adding a city to the list
    @objc private func addCity() {
        alertPlusCity(name: "Город", placeholder: "Введите название города") { cityName in
            if cityName != "" {
                self.presenter.checkCityContains(city: cityName) { city,
                                                                   placeholderDescription in
                    if let city = city {
                        DispatchQueue.global().async {
                            self.presenter.addCity(city: city)
                        }
                    } else {
                        if let placeholderDescription = placeholderDescription {
                            self.alertWrongCity(title: placeholderDescription)
                        }
                    }
                }
            } else {
                self.alertWrongCity(title: "Введите название города")
            }
        }
    }
    // MARK: - Add SearchBar
    private func addSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.backgroundColor = .white
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    // MARK: - Table view data source and delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(isFiltering: isFiltering)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        guard let currentWeatherCity = presenter.currentWeatherCity(forIndexPath: indexPath, isFiltering: isFiltering) else { return cell }
        cell.weatherCity = currentWeatherCity
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [self] _, _, completionHandler in
            presenter.deleteCity(forIndexPath: indexPath, isFiltering: isFiltering)
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tapOnTheCity(forIndexPath: indexPath, isFiltering: isFiltering)
    }
}
// MARK: - ReloadView
extension MainViewController: RootTableViewControllerViewProtocol {
    func reloadView() {
            self.tableView.reloadData()
    }
}
// MARK: - SearchController delegate
extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter.filteredCity(text: searchController.searchBar.text!)
    }
}
