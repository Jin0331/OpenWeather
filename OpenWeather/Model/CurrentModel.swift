//
//  Weather.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

//MARK: - Quicktype 활용
import Foundation

// MARK: - Weather
struct Current: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}
