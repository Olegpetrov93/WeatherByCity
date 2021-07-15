//
//  WeatherParser.swift
//  TestWeather
//
//  Created by Алла Даминова on 14.07.2021.
//

import Foundation

// MARK: - CurrentWeatherData
struct CurrentWeatherData: Codable {
    let info: Info
    let geo_object: GeoObject
    let fact: Fact
}

// MARK: - GeoObject
struct GeoObject: Codable {
    let district, locality, province, country: Country
}

// MARK: - Country
struct Country: Codable {
    let id: Int
    let name: String
}

// MARK: - Fact
struct Fact: Codable {
    let temp: Int
    let icon: String
    let condition: String
    let wind_speed: Double
    let wind_dir: String
    let pressure_mm: Double
    let humidity: Double
}

struct Info: Codable {
    let lat, lon: Double
}

class WeatherParser: WeatherParserProtocol {
    typealias Model = WeatherModel
    
    func parse(data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrentWeatherData.self, from: data)
            let factCondition = decodedData.fact.condition
            let name = decodedData.geo_object.locality.name
            let temp = decodedData.fact.temp
            let icon = decodedData.fact.icon
            let windSpeed = decodedData.fact.wind_speed
            let windDir = decodedData.fact.wind_dir
            let pressureMm = decodedData.fact.pressure_mm
            let humidity = decodedData.fact.humidity
            let lat = decodedData.info.lat
            let lon = decodedData.info.lon
            let weather = WeatherModel(condition: factCondition,
                                       name: name,
                                       temp: Double(temp),
                                       icon: icon,
                                       wind_speed: windSpeed,
                                       wind_dir: windDir,
                                       pressure_mm: Double(pressureMm),
                                       humidity: Double(humidity),
                                       lat: lat, lon: lon)
            return weather
        } catch {
            print("\(error.localizedDescription) trying to convert data to JSON")
            return nil
        }
    }
}
