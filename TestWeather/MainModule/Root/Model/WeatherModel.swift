//
//  WeatherModel.swift
//  TestWeather
//
//  Created by Алла Даминова on 15.07.2021.
//

import Foundation

struct WeatherModel {
    let condition: String
    let name: String
    let temp: Double
    let icon: String
    let wind_speed: Double
    let wind_dir: String
    let pressure_mm: Double
    let humidity: Double
    let lat: Double
    let lon: Double
}

struct City {
    let lat: Double
    let lon: Double
    
    static func getCites() -> [City] {
        let cityArray: [City] = [City(lat: 51.5085300, lon: -0.1257400),
                                   City(lat: 40.7142700, lon: -74.0059700),
                                   City(lat: 52.5243700, lon: 13.4105300),
                                   City(lat: 1.2896700, lon: 103.8500700),
                                   City(lat: 35.6895000, lon: 139.6917100),
                                   City(lat: 53.9000000, lon: 27.5666700),
                                   City(lat: 27.7016900, lon: 85.3206000),
                                   City(lat: 24.4666700, lon: 54.3666700),
                                   City(lat: -15.7797200, lon: -47.9297200),
                                   City(lat: 64.1354800, lon: -21.8954100)]
        return cityArray
    }
}
