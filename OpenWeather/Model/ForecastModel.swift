//
//  Forecast.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import Foundation

// MARK: - Welcome
struct ForecastModel: Decodable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Decodable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - List
struct List: Decodable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility : Int
    let pop : Double
    let sys: Sys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
    }
}
