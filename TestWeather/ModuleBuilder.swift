//
//  ModuleBuilder.swift
//  TestWeather
//
//  Created by Алла Даминова on 15.07.2021.
//

import UIKit

protocol AssemblyBuilderProtocol: class {
    func createMainModule(router: RouterProtocol) -> UITableViewController
//    func createDetailModule(city: WeatherModel?, router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UITableViewController {
        let weatherRequestSender = WeatherRequestSender()
        let view = MainViewController()
        let networkService = NetworkService(requestSender: weatherRequestSender)
        let presenter = RootTableViewControllerPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
//    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
//        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailStoryboard") as! DetailViewController
//        let presenter = DetailPresenter(view: detailViewController, router: router, city: city)
//        detailViewController.detailPresenter = presenter
//        return detailViewController
//    }
}
