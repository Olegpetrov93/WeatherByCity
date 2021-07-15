//
//  WeatherParserProtocol.swift
//  TestWeather
//
//  Created by Алла Даминова on 14.07.2021.
//

import Foundation

protocol WeatherParserProtocol {
    associatedtype Model
    func parse(data: Data) -> Model?
}
