//
//  Forecast.swift
//  OpenWeather
//
//  Created by JinwooLee on 2/11/24.
//

import UIKit


// MARK: - Welcome
struct ForecastModel: Decodable {
    let cod: String
    let message, cnt: Int
    let list: [ForecastList]
    let city: City
    
    //TODO: - 3일동안 3시간 간격 -> APIRequest를 호출한 시점을 기준으로, index slicing? 어차피 40개로 한정되어있음. 24시간 8개. 3일이면 24 -> 즉 [:25] 까지하면 해당 호출 시점기준으로 3일간 슬라이싱 됨
    var threeHourDuringThreeDays : [ForecastList] {
        get {
            return Array(list[0..<25])
        }
    }
    
    //    //TODO: - 5일동안 평균 최고 최저 온도. 요소별로 접근해서 일자별 평균 온도. 이때, Dictionary를 이용해서 날짜를 박는게 좋을 듯
    //    var fiveDaysFromMinMiax : [ForecastList] {
    //        get {
    //
    //        }
    //    }
    
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
struct ForecastList: Decodable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility : Int
    let pop : Double
    let sys: Sys
    let dtTxt: String //TODO: - dtTXT를 잘 활용해야됨.ㅠ
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
    }
    
    var dtConvert : Date {
        get {
            let timeInterval = TimeInterval(String(dt))!
            let utcTime = Date(timeIntervalSince1970: timeInterval)
            return utcTime
            
        }
    }
}
