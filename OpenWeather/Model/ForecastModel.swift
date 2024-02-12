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
    
    //TODO: - 3일동안 3시간 간격 -> APIRequest를 호출한 시점을 기준으로, index slicing? 어차피 40개로 한정되어있음. 24시간 8개. 3일이면 24 -> 즉 [:25] 까지하면 해당 호출 시점기준으로 3일간 슬라이싱 됨아래 -> 아래 방식으로 명확하게 변경함
    var threeHourDuringThreeDays : [[Any]] {
        get {
            // 현재 일(dd)
            let currentTime = (Int(Date().toString(dateFormat: "dd"))!)
            let threeDays = (currentTime...currentTime+2).map{return String($0)}
            var threeDaysList = list.filter{ threeDays.contains($0.dtConvertDay)}
            
            threeDaysList.sort { return $0.dt < $1.dt } // dt 기준으로 제일 빠른 시간이 앞으로 오도록,, 물론 위에 단계에서 순서는 고정되는 것 같지만, 만약의 경우를 대비해서
            
            // 필요한 값들만 추출
            let resultList = threeDaysList.map {
                return [$0.dt, $0.dtConvertHour, $0.main.tempConvert, $0.weather[0].icon]
            }
            
            return resultList
        }
    }
    
    //TODO: - 5일동안 평균 최고 최저 온도. 요소별로 접근해서 일자별 평균 온도. 이때, Dictionary를 이용해서 날짜를 박는게 좋을 듯
    var fiveDaysFromMinMiax : [[String]] {
        get {
            
            let currentTime = (Int(Date().toString(dateFormat: "dd"))!)
            let threeDays = (currentTime+1...currentTime+4).map{return String($0)} // 오늘 뺴고 4일
            let convertList = list.filter{ threeDays.contains($0.dtConvertDay)}
            let dictByDt = Dictionary(grouping: convertList) { return $0.dtConvertDay }
            
            let arrayByMinMax = dictByDt.map { k, v in
                
                let minTempMin = v.min { return $0.main.temp < $1.main.temp }?.main.temp ?? 0
                let maxTempMax = v.max { return $0.main.temp < $1.main.temp }?.main.temp ?? 0
                
                // 오후 12시의 icon (오늘 제외)
                let icon = v.filter{$0.dtConvertHour == "12"}.map {
                    return $0.weather[0].icon}
                let yoil = v.map{ $0.dtConvertDayName}
                return [k, yoil.randomElement()!, String(format: "%.1f", minTempMin-273.15), String(format: "%.1f", maxTempMax-273.15), icon.randomElement()!]
            }
            
            return arrayByMinMax.sorted { return $0[0] < $1[0] }
            
        }
    }
    
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
    let main: MainData
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility : Int
    let dtTxt: String //TODO: - dtTXT를 잘 활용해야됨.ㅠ
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility
        case dtTxt = "dt_txt"
    }
    
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
