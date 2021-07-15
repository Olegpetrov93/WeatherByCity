//
//  RequestFactory.swift
//  TestWeather
//
//  Created by Алла Даминова on 14.07.2021.
//

import Foundation

struct RequestFactory {
    struct Request {
        static func newWeatherConfig() -> RequestConfig<WeatherParser> {
            return RequestConfig<WeatherParser>(request: WeatherRequest(), parser: WeatherParser())
        }
    }
}
