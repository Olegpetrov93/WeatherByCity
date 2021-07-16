//
//  DetailCityPreaenter.swift
//  TestWeather
//
//  Created by Oleg on 7/16/21.
//

import Foundation
// MARK: View -
protocol DetailCityViewControllerViewProtocol: AnyObject {
}

// MARK: Presenter -
protocol DetailCityViewControllerPresenterProtocol: AnyObject {
    var view: DetailCityViewControllerViewProtocol? { get set }
    var weatherCity: WeatherModel? { get set }
    init(view: DetailCityViewControllerViewProtocol, router: RouterProtocol, city: WeatherModel)
}

class DetailCityViewControllerPresenter: DetailCityViewControllerPresenterProtocol {
    weak var view: DetailCityViewControllerViewProtocol?
    var weatherCity: WeatherModel?
    var router: RouterProtocol?
    
    required init(view: DetailCityViewControllerViewProtocol, router: RouterProtocol, city: WeatherModel) {
        self.view = view
        self.router = router
        self.weatherCity = city
    }
}
