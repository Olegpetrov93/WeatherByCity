//
//  RequestSender.swift
//  TestWeather
//
//  Created by Алла Даминова on 14.07.2021.
//

import Foundation

class WeatherRequest: WeatherRequestProtocol {
    
    private func urlComponents(lat: String, lon: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.weather.yandex.ru"
        urlComponents.path = "/v2/forecast/"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lon", value: "\(lon)"),
            URLQueryItem(name: "extra", value: "true"),
            URLQueryItem(name: "lang", value: "ru_RU")]
        
        return urlComponents.url
    }
    
    func urlRequest(lat: String?, lon: String?) -> URLRequest? {
        guard let lat = lat, let lon = lon else { return nil }
        
        guard let url = urlComponents(lat: lat, lon: lon) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("af7edd2e-792e-45df-a9b5-dd6680f4badc", forHTTPHeaderField: "X-Yandex-API-Key")
        request.timeoutInterval = 60.0
        return request
    }
}
