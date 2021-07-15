//
//  NetworkManager.swift
//  TestWeather
//
//  Created by Алла Даминова on 15.07.2021.
//

protocol NetworkServiceProtocol: AnyObject {
    func loadData(lat: String, lon: String, completionHandler: @escaping (WeatherModel?, String?) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    let requestSender: RequestSenderProtocol
    
    init(requestSender: RequestSenderProtocol) {
        self.requestSender = requestSender
    }
    
    func loadData(lat: String, lon: String, completionHandler: @escaping (WeatherModel?, String?) -> Void) {
        let requestConfig = RequestFactory.Request.newWeatherConfig()
        requestSender.send(lat: lat, lon: lon, icon: nil, requestConfig: requestConfig) { (result: Result<WeatherModel>) in
              switch result {
              case .success(let weatherModel):
                  completionHandler(weatherModel, nil)
              case .error(let error):
                  completionHandler(nil, error)
            }
        }
    }
}
