//
//  RequestProtocol.swift
//  TestWeather
//
//  Created by Oleg on 7/15/21.
//

import Foundation

protocol WeatherRequestProtocol {
    func urlRequest(lat: Double?, lon: Double?) -> URLRequest?
}
