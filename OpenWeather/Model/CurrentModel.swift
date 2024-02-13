//
//  Weather.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

//MARK: - Quicktype 활용
import Foundation

// MARK: - Weather
struct CurrentModel: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: MainData
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
    
    var dtConvert : Date {
        get {
            let timeInterval = TimeInterval(String(dt))!
            let utcTime = Date(timeIntervalSince1970: timeInterval)
            return utcTime
            
        }
    }
    
    var dtConvertDay : String {
        get {
            return dtConvert.toString(dateFormat: "dd")
        }
    }
    
    var dtConvertDayName : String {
        get {
            return dtConvert.toString(dateFormat: "EEE")
        }
    }
    
    var dtConvertHour : String {
        get {
            return dtConvert.toString(dateFormat: "hh")
        }
    }
    
}
