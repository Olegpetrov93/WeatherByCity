//
//  Router.swift
//  TestWeather
//
//  Created by Алла Даминова on 15.07.2021.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var tableviewController: UITableViewController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
    init(tableviewController: UITableViewController, assemblyBuilder: AssemblyBuilderProtocol)
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(city: WeatherModel?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var tableviewController: UITableViewController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    required init(tableviewController: UITableViewController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = UINavigationController()
        self.tableviewController = tableviewController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        guard let navigationController = self.navigationController,
              let initialController = assemblyBuilder?.createMainModule(router: self) else { return }
        navigationController.viewControllers = [initialController]
    }
    
    func showDetail(city: WeatherModel?) {
//        guard let navigationController = self.navigationController,
//              let detailViewController = assemblyBuilder?.createDetailModule(city: city, router: self) else { return }
//        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func popToRoot() {
        guard let navigationController = self.navigationController else { return }
        navigationController.popViewController(animated: true)
    }
}
