//
//  NetworkManager.swift
//  TestWeather
//
//  Created by Алла Даминова on 15.07.2021.
//
import Foundation
import CoreLocation

protocol NetworkServiceProtocol: AnyObject {
    func loadData(city: String, completionHandler: @escaping (WeatherModel?, String?) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    let requestSender: RequestSenderProtocol
    
    init(requestSender: RequestSenderProtocol) {
        self.requestSender = requestSender
    }
    
    func loadData(city: String, completionHandler: @escaping (WeatherModel?, String?) -> Void) {
        getCoordinateFrom(city: city) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            let requestConfig = RequestFactory.Request.newWeatherConfig()
            self.requestSender.send(lat: coordinate.latitude, lon: coordinate.longitude, requestConfig: requestConfig) { (result: Result<WeatherModel>) in
                switch result {
                case .success(let weatherModel):
                    completionHandler(weatherModel, nil)
                case .error(let error):
                    completionHandler(nil, error)
                }
            }
        }
    }
    
    func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?,_ error: Error?) -> ()) {
        CLGeocoder().geocodeAddressString(city) { placeMark, error in
            completion(placeMark?.first?.location?.coordinate, error)
        }
    }
}
