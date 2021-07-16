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
    
    var conditionString: String {
        switch condition {
        case "clear" : return "Ясно"
        case "partly-cloudy" : return "Малооблачно"
        case "cloudy" : return "Облачно с прояснениями"
        case "overcast" : return "Пасмурно"
        case "drizzle" : return "Морось"
        case "light-rain" : return "Небольшой дождь"
        case "rain" : return "Дождь"
        case "moderate-rain" : return "Умеренно сильный дождь"
        case "heavy-rain" : return "Сильный дождь"
        case "continuous-heavy-rain" : return "Длительный сильный дождь"
        case "showers" : return "Ливень"
        case "wet-snow" : return "Дождь со снегом"
        case "light-snow" : return "Небольшой снег"
        case "snow" : return "Снег"
        case "snow-showers" : return "Снегопад"
        case "hail" : return "Град"
        case "thunderstorm" : return "гроза"
        case "thunderstorm-with-rain" : return "Дождь с грозой"
        case "thunderstorm-with-hail" : return "Гроза с градом"
        default: return ""
        }
    }
}

struct City {
    
    static func getCites() -> Set<String> {
        let cityArray: Set<String> = ["Москва", "Казань", "Санкт-Петербург", "Новосибирск", "Екатеринбург", "Нижний Новгород", "Самара", "Челябинск", "Омск", "Ростов-на-Дону", ]
        return cityArray
    }
}
