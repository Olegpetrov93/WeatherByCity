//
//  ModuleBuilder.swift
//  TestWeather
//
//  Created by Алла Даминова on 15.07.2021.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    func createMainModule(router: RouterProtocol) -> UITableViewController
    func createDetailModule(city: WeatherModel, router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UITableViewController {
        let weatherRequestSender = WeatherRequestSender()
        let view = MainViewController()
        let networkService = NetworkService(requestSender: weatherRequestSender)
        let presenter = RootTableViewControllerPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(city: WeatherModel, router: RouterProtocol) -> UIViewController {
        let view = DetailCityViewController()
        let presenter = DetailCityViewControllerPresenter(view: view, router: router, city: city)
        view.presenter = presenter
        return view
    }
}
