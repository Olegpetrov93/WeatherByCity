//
//  RequestSenderProtocol.swift
//  TestWeather
//
//  Created by Oleg on 7/15/21.
//

import Foundation

struct RequestConfig<Parser> where Parser: WeatherParserProtocol {
    let request: WeatherRequestProtocol
    let parser: Parser
}

enum Result<Model> {
    case success(Model)
    case error(String)
}

protocol RequestSenderProtocol {
    func send<Parser>(lat: Double?, lon: Double?, requestConfig config: RequestConfig<Parser>,
    completionHandler: @escaping (Result<Parser.Model>) -> Void) where Parser: WeatherParserProtocol
}
