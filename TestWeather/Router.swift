//
//  Router.swift
//  TestWeather
//
//  Created by Алла Даминова on 15.07.2021.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol)
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(city: WeatherModel?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    required init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
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
