//
//  File.swift
//  TestWeather
//
//  Created by Алла Даминова on 14.07.2021.
//

import Foundation

class WeatherRequestSender: RequestSenderProtocol {

    private func sessionFunc() -> URLSession {
           let configuration = URLSessionConfiguration.default
           return URLSession(configuration: configuration)
    }
    
    func send<Parser>(lat: Double?, lon: Double?,
                      requestConfig config: RequestConfig<Parser>,
                      completionHandler: @escaping (Result<Parser.Model>) -> Void)
    where Parser: WeatherParserProtocol {
        guard let urlRequest = config.request.urlRequest(lat: lat, lon: lon) else {
               completionHandler(Result.error("URL string can't be parsed to URL"))
               return
           }
           let session = sessionFunc()
           let task = session.dataTask(with: urlRequest) { (data, _, error) in
               if let error = error {
                   completionHandler(Result.error(error.localizedDescription))
                   return
               }
               guard let data = data,
                let parsedModel: Parser.Model = config.parser.parse(data: data) else {
                       completionHandler(Result.error("Recieved data can't be parsed"))
                       return
               }
               completionHandler(Result.success(parsedModel))
           }
           task.resume()
       }
}
